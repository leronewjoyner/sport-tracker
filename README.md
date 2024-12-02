This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

To run project:

run sql file 459final_setup.sql in SQL Workbench to implement schema
in src/lib/db.ts change dbconfig to match your local server settings
run next dev script from package.json

Project Report: Sports Team Stats Tracker
Team:
BACKEND Engineer : Joseph Olaleye
BACKEND Engineer : Paul Enyi
BACKEND Engineer : Angel Maiga
FRONTEND Engineer: Stephan Akinjide
FRONTEND Engineer : Lerone Joyner

1. Introduction
Motivation:
The Sports Team Stats Tracker was created in response to the growing demand for a comprehensive platform that monitors and evaluates the performance of sports teams. Conventional approaches, such as looking through several websites or printed materials, are frequently ineffective. This program is a comprehensive resource for sports fans, fantasy players, and analysts since it offers a centralized system with accurate,up-to-date statistics and historical data.
Target Audience:
Avid Sports Fans: For up-to-date updates on team and player performances.
Fantasy Sports Players: To make informed decisions using performance metrics.
Sports Analysts: For in-depth analysis of trends and comparisons.

2. Design
System Methodology: The system employs a structured design approach to create a comprehensive sports tracking platform that integrates a relational database with a responsive web interface for seamless analysis and interaction.
Application Area Identification:
Focused on NBA teams and performance metrics.
Covers historical data for the 2023-2024 season to allow users to analyze team and player performance over time.
Functional Requirements:
Features:
Team and player tracking to view statistics and performance metrics.
Stat entry functionality.
Data Modeling:
Entity Relationships:
Established connections between entities such as Teams, Players, Games, Player Stats, and Team Stats.
Constraints:
Enforced data integrity and accuracy across all entities.
Database Schema:
Tables include:
Teams Table: team_id, team_name, city, arena, coach_id.
Team States Table: team_stat_id, team_id, wins, losses
Coaches Table: Coach_id, Name, DOB, Experience, Championships
Players Table: player_id, team_id, name, height, weight, position,dob, jersey_no
Player Stats Table: stat_id, player_id, total_points
Games Table: game_id, h_team_id, a_team_id, h_team_score_ a_team_score, game_date.
Normalization:
Ensures redundancy elimination and data integrity for efficient storage and retrieval.
ER Diagram:
Visualizes relationships between key tables, highlighting dependencies and associations.
Relationships enable seamless integration and accessibility of data.
Screenshots:(Schema or ER Diagram Screenshot)

3. Implementation
Backend Implementation
Database:
Created a MySQL database named "Sports Tracker" with interconnected tables: Coaches, Teams, Players, Player_Stats, Games, and Team_Stats.
Populated data for coaches, teams, and team statistics, focusing on five NBA teams and their inter-conference games for scalability and targeted insights.
Ensured data integrity and completeness through normalized schema design.
Server:
Built using Node.js and Express.js to manage backend operations.
Developed RESTful APIs for seamless retrieval and updating of team and player statistics.
Frontend Implementation
Framework:
Used Next.js to create responsive, interactive pages for user engagement.
Data Integration:
Established real-time communication between the database and the frontend to ensure accurate data retrieval and updates.
Data Display:
Implemented features to visualize stored data, including team standings, player performances, and game results.
Displayed tables for coaches, players, and stats seamlessly connected to the backend database for a smooth user experience.
Data Entry:
Implemented feature to allow for single game statistics and results to be entered via the frontend
Built functionality to reflect results of each game across all relevant tables in the database.

4. Functionality
User Features
Team and Player Stats Tracking:
Users can browse detailed metrics for selected NBA teams and players through an intuitive interface.
Admin Stat Entry
Admins can enter the results of each game along with each player's statistics, allowing them to instantly be reflected in the database.
Screenshots: of the user dashboard, player stats display
Stat Viewing Page:

Stat Entry Page:


5. User Manual
For End Users:
Browse Teams and Players:
Navigate through the dashboard for stats and information for teams, players, coaches, and games.
Enter statistics:
After each game, administrators can go to the stat entry tab and enter the results of the game along with each player's stats.

6. Conclusion
The Sports Team Stats Tracker is a robust platform designed to bridge the gap between raw data and meaningful insights. Tailored to the needs of sports fans, fantasy players, analysts, and casual viewers, it simplifies access to historical data while maintaining a flexible and intuitive design. By focusing on the 2022-2024 NBA seasons, the system balances depth of information with ease of use, keeping users updated and engaged with team and player performance metrics.
Future Improvements:
Real-Time Data Updates:
Transition to live stat tracking for ongoing games.
Advanced Analytics:
Incorporate visualization tools and predictive analytics.
User Engagement:
Add forums and sharing features for community discussions.
Personalization:
Create an interface for users to create profiles and have customized dashboards to track their favorite teams and players.

7. Implementation Video
implementation vid.mp4
https://drive.google.com/file/d/1JtoBOnAjgWpVXIMI9hu151gJszLCjRSU/view?usp=sharing 

8. User Manual Video
user_manual vid.mp4
https://drive.google.com/file/d/1DemAze_K38YsRQlJzlLmXdvBChnlZSlj/view?usp=sharing 

9. GITHUB LINK
https://github.com/leronewjoyner/sport-tracker 
