This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

To run project:

run sql file 459final_setup.sql in SQL Workbench to implement schema
in src/lib/db.ts change dbconfig to match your local server settings
run next dev script from package.json

# Project Report: Sports Team Stats Tracker

## Team:
- **Backend Engineers**:  
  - Joseph Olaleye  
  - Paul Enyi  
  - Angel Maiga  
- **Frontend Engineers**:  
  - Stephan Akinjide  
  - Lerone Joyner  

---

## 1. Introduction

### Motivation:
The Sports Team Stats Tracker was created to address the need for a centralized platform to monitor and evaluate sports team performance. Traditional methods, like browsing multiple websites or printed materials, are often inefficient. This program serves as a comprehensive resource for sports fans, fantasy players, and analysts by providing accurate, up-to-date statistics and historical data in one location.

### Target Audience:
- **Avid Sports Fans**: For real-time updates on team and player performances.  
- **Fantasy Sports Players**: To make informed decisions using performance metrics.  
- **Sports Analysts**: For in-depth trend analysis and comparisons.  

---

## 2. Design

### System Methodology:
The system uses a structured design approach, combining a relational database with a responsive web interface for seamless analysis and interaction.

### Application Area Identification:
- Focused on **NBA teams** and performance metrics.
- Covers **historical data** for the 2023-2024 season, enabling users to analyze team and player performance over time.

### Functional Requirements:
#### Features:
- Team and player tracking for statistics and performance metrics.  
- Stat entry functionality for game results.  

#### Data Modeling:
- **Entity Relationships**: Links between entities like Teams, Players, Games, Player Stats, and Team Stats.  
- **Constraints**: Ensure data integrity and accuracy.

#### Database Schema:
- **Tables**:  
  - `Teams`: `team_id`, `team_name`, `city`, `arena`, `coach_id`  
  - `Team Stats`: `team_stat_id`, `team_id`, `wins`, `losses`  
  - `Coaches`: `coach_id`, `name`, `dob`, `experience`, `championships`  
  - `Players`: `player_id`, `team_id`, `name`, `height`, `weight`, `position`, `dob`, `jersey_no`  
  - `Player Stats`: `stat_id`, `player_id`, `total_points`  
  - `Games`: `game_id`, `h_team_id`, `a_team_id`, `h_team_score`, `a_team_score`, `game_date`  

- **Normalization**: Eliminates redundancy and ensures efficient storage and retrieval.

#### ER Diagram:
- Visualizes relationships between tables, highlighting dependencies and associations for seamless data integration and accessibility.

--![alt text](<Screenshot 2024-12-02 082419.png>)
--![!()](<Screenshot 2024-12-02 082720.png>)

## 3. Implementation

### Backend Implementation
#### Database:
- Created a **MySQL database** named "Sports Tracker" with interconnected tables: Coaches, Teams, Players, Player Stats, Games, and Team Stats.  
- Populated data for five NBA teams and their inter-conference games.  
- Ensured data integrity with a normalized schema design.

#### Server:
- Built using **Node.js** and **Express.js** to handle backend operations.  
- Developed **RESTful APIs** for retrieving and updating team and player statistics.

### Frontend Implementation
#### Framework:
- Used **Next.js** to create responsive, interactive pages for user engagement.

#### Data Integration:
- Enabled real-time communication between the database and frontend for accurate data updates.  

#### Data Display:
- Visualized stored data, including team standings, player performances, and game results.  
- Connected tables for coaches, players, and stats seamlessly with the backend database.  

#### Data Entry:
- Added functionality to allow single-game statistics and results to be entered via the frontend.  
- Automatically reflected game results across relevant database tables.

---

## 4. Functionality

### User Features:
- **Team and Player Stats Tracking**:  
  Users can browse detailed metrics for NBA teams and players via an intuitive interface.  
- **Admin Stat Entry**:  
  Admins can enter game results and player statistics, which are instantly reflected in the database.

### Screenshots:
- **User Dashboard and Player Stats Display**: [Stat Viewing Page](#) ![](<Screenshot 2024-12-02 075212.png>)
- **Stat Entry Page**: [Stat Entry Page](#) ![](<Screenshot 2024-12-02 075313.png>)

---

## 5. User Manual

### For End Users:
- **Browse Teams and Players**:  
  Use the dashboard to access stats and information on teams, players, coaches, and games.  
- **Enter Statistics**:  
  After each game, administrators can input results and player stats via the stat entry tab.

---

## 6. Conclusion

The Sports Team Stats Tracker bridges the gap between raw data and meaningful insights. Designed for sports fans, fantasy players, analysts, and casual viewers, it simplifies access to historical data with a flexible and user-friendly design. By focusing on the 2022-2024 NBA seasons, the platform balances comprehensive information with usability, keeping users updated on team and player performances.

### Future Improvements:
- **Real-Time Data Updates**: Live stat tracking for ongoing games.  
- **Advanced Analytics**: Visualization tools and predictive analytics.  
- **User Engagement**: Forums and sharing features for community discussions.  
- **Personalization**: Customized dashboards for tracking favorite teams and players.  

---

## 7. Implementation Video:
[Implementation Video](https://drive.google.com/file/d/1JtoBOnAjgWpVXIMI9hu151gJszLCjRSU/view?usp=sharing)

## 8. User Manual Video:
[User Manual Video](https://drive.google.com/file/d/1DemAze_K38YsRQlJzlLmXdvBChnlZSlj/view?usp=sharing)

## 9. GitHub Repository:
[GitHub Link](https://github.com/leronewjoyner/sport-tracker)
