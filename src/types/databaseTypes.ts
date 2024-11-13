export type DataOption = 'teams' | 'players' | 'coaches' | 'games' | 'team_stats' | 'player_stats';

export interface Team {
    Team_ID: number;
    Team_Name: string;
    City: string;
    Arena: string;
    Coach_ID: number | null;
}

export interface Player {
    Player_ID: number;
    Team_ID: number;
    Name: string;
    Height: number;
    Weight: number;
    Position: string;
    DOB: string;
    Jersey_No: number;
}

export interface Coach {
    Coach_ID: number;
    Name: string;
    DOB: string;
    Experience: number | null;
    Championships: number | null;
}

// Define other interfaces as needed
