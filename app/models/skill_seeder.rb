class SkillSeeder
  def self.seed
    skills = [".NET",
              "AJAX",
              "Agile software development",
              "Algorithms",
              "Android",
              "AngularJS",
              "Artificial Intelligence",
              "AspectJS",
              "Backbone.js",
              "Balsamiq",
              "Basecamp",
              "CSS",
              "CSS3",
              "CakePHP",
              "Capistrano",
              "Chart.js",
              "Clojure",
              "Cocoa",
              "CoffeeScript",
              "Cryptography",
              "Cucumber",
              "Data Modeling",
              "Data Structures",
              "Data Visualization",
              "Database Administration",
              "Debian OS",
              "DevOps",
              "Django",
              "Docker",
              "Document Object Model",
              "Drupal",
              "Elasticsearch",
              "Ember.js",
              "Erlang",
              "Flask",
              "Flowcharts",
              "Frontend Development",
              "Geolocation",
              "Git",
              "GitHub",
              "AdSense",
              "Google AdWords Development",
              "Google Apps",
              "HAML",
              "HTML",
              "HTML5",
              "Haskell",
              "Heroku",
              "Highcharts",
              "Highwire",
              "Information Architecture",
              "Information Management",
              "Information Security",
              "JQuery",
              "JSON",
              "Java",
              "Javascript",
              "KnockoutJS",
              "LESS",
              "MVC Framework",
              "Machine Learning",
              "Meteor",
              "NoSQL",
              "Node.js",
              "OAuth",
              "PHP",
              "Object Oriented Programming",
              "Object oriented design",
              "Objective-C",
              "Payment Processing",
              "Penetration Testing",
              "Performance Tuning",
              "Perl",
              "PhoneGap",
              "PostgreSQL",
              "Puppet",
              "Python",
              "QA",
              "RSpec",
              "React.js",
              "Regular Expressions",
              "Relational Databases",
              "Ruby",
              "Ruby on Rails",
              "SQL",
              "SaaS",
              "Sass",
              "Scala",
              "Scrum",
              "Security Engineering",
              "Selenium",
              "Sinatra Framework",
              "Smalltalk",
              "Social Networking Development",
              "Squarespace",
              "Stripe",
              "Subversion",
              "Swift",
              "Twilio API",
              "Twitter API",
              "Twitter Bootstrap",
              "Unit Testing",
              "Unix",
              "User acceptance testing",
              "VB.NET",
              "Version Control",
              "Vim",
              "Virtual Currency",
              "Virtuoso",
              "Voldemort",
              "Web Development",
              "Web Programming",
              "WordPress",
              "XAML",
              "XHTML",
              "YAML",
              "Zurb Foundation",
              "iOS",
              "iPhone App Development",
              "jQuery",
              "Adminstration"]
    skills.each do |skill|
      Skill.find_or_create_by(name: skill)
      Preference.find_or_create_by(name: skill)
    end
  end
end
