using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;

namespace alshariarhossain
{
    public partial class Home : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSkills();
                LoadProjects();
            }
        }

        private void LoadSkills()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT Category, SkillName, ProficiencyLevel, IconClass 
                                   FROM Skills 
                                   ORDER BY Category, SkillName";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            // Group skills by category using traditional grouping
                            var skillsByCategory = new Dictionary<string, List<DataRow>>();

                            foreach (DataRow row in dt.Rows)
                            {
                                string category = row["Category"].ToString();
                                if (!skillsByCategory.ContainsKey(category))
                                {
                                    skillsByCategory[category] = new List<DataRow>();
                                }
                                skillsByCategory[category].Add(row);
                            }

                            skillsGrid.InnerHtml = GenerateSkillsHtml(skillsByCategory);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error or handle gracefully
                skillsGrid.InnerHtml = "<div class='error-message'>Error loading skills. Please try again later.</div>";
            }
        }

        private string GenerateSkillsHtml(Dictionary<string, List<DataRow>> skillsByCategory)
        {
            string html = "";

            foreach (var category in skillsByCategory)
            {
                string categoryName = category.Key;
                string iconClass = GetCategoryIcon(categoryName);
                int proficiencyLevel = CalculateCategoryProficiency(category.Value);

                html += $@"
                <div class='skill-category'>
                    <div class='skill-icon'>
                        <i class='{iconClass}'></i>
                    </div>
                    <h3 class='skill-title'>{categoryName}</h3>
                    <div class='skill-list'>";

                foreach (DataRow skill in category.Value)
                {
                    html += $"<span class='skill-item'>{skill["SkillName"]}</span>";
                }

                html += $@"
                    </div>
                    <div class='skill-progress'>
                        <div class='progress-bar' data-width='{proficiencyLevel}%'></div>
                    </div>
                </div>";
            }

            return html;
        }

        private string GetCategoryIcon(string categoryName)
        {
            switch (categoryName.ToLower())
            {
                case "frontend development":
                    return "fas fa-code";
                case "backend development":
                    return "fas fa-server";
                case "database & cloud":
                    return "fas fa-database";
                case "development tools":
                    return "fas fa-tools";
                default:
                    return "fas fa-star";
            }
        }

        private int CalculateCategoryProficiency(List<DataRow> skills)
        {
            if (skills == null || skills.Count == 0) return 0;

            int total = 0;
            foreach (DataRow skill in skills)
            {
                total += Convert.ToInt32(skill["ProficiencyLevel"]);
            }

            return (int)Math.Round((double)total / skills.Count);
        }

        private void LoadProjects()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT ProjectName, Description, Technologies, ProjectUrl, GithubUrl, ImageUrl
                                   FROM Projects 
                                   WHERE IsActive = 1
                                   ORDER BY CreatedAt DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            projectsGrid.InnerHtml = GenerateProjectsHtml(dt);
                        }
                        else
                        {
                            projectsGrid.InnerHtml = "<div class='no-projects'>No projects found.</div>";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                projectsGrid.InnerHtml = "<div class='error-message'>Error loading projects. Please try again later.</div>";
            }
        }

        private string GenerateProjectsHtml(DataTable projects)
        {
            string html = "";

            foreach (DataRow project in projects.Rows)
            {
                string technologies = project["Technologies"].ToString();
                string[] techArray = technologies.Split(',');

                html += $@"
                <div class='project-card'>
                    <h3>{project["ProjectName"]}</h3>
                    <p>{project["Description"]}</p>
                    <div class='tech-tags'>";

                foreach (string tech in techArray)
                {
                    if (!string.IsNullOrWhiteSpace(tech))
                    {
                        html += $"<span>{tech.Trim()}</span>";
                    }
                }

                html += @"</div>";

                // Add project links if available
                string projectUrl = project["ProjectUrl"].ToString();
                string githubUrl = project["GithubUrl"].ToString();

                if (!string.IsNullOrEmpty(projectUrl) || !string.IsNullOrEmpty(githubUrl))
                {
                    html += @"<div class='project-links'>";

                    if (!string.IsNullOrEmpty(projectUrl))
                    {
                        html += $@"<a href='{projectUrl}' target='_blank' class='project-link'>
                                  <i class='fas fa-external-link-alt'></i> Live Demo
                                  </a>";
                    }

                    if (!string.IsNullOrEmpty(githubUrl))
                    {
                        html += $@"<a href='{githubUrl}' target='_blank' class='project-link'>
                                  <i class='fab fa-github'></i> GitHub
                                  </a>";
                    }

                    html += "</div>";
                }

                html += "</div>";
            }

            return html;
        }
    }
}