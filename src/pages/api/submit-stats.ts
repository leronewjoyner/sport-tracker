import { connectToDatabase } from '../../lib/db';
import { ResultSetHeader } from 'mysql2';

export default async function handler(req, res) {
    if (req.method !== 'POST') {
        return res.status(405).json({ message: 'Method not allowed' });
    }

    const { gameDate, homeTeam, awayTeam, stats } = req.body;

    try {
        const db = await connectToDatabase();

        // Insert the game into the games table
        const [gameResult] = await db.execute<ResultSetHeader>(
            'INSERT INTO games (H_Team_ID, A_Team_ID, H_Team_Score, A_Team_Score, Game_Date) VALUES (?, ?, 0, 0, ?)',
            [homeTeam, awayTeam, gameDate]
        );

        const gameId = gameResult.insertId; // Retrieve the inserted Game_ID

        let homeScore = 0;
        let awayScore = 0;

        // Insert player stats and calculate team scores
        for (const stat of stats) {
            const { Player_ID, Points, Team_ID } = stat;

            // Update cumulative total points in player_stats
            await db.execute(
                'UPDATE player_stats SET Total_Points = Total_Points + ? WHERE Player_ID = ?',
                [Points, Player_ID]
            );

            // Calculate scores for each team
            if (Team_ID === homeTeam) {
                homeScore += Points;
            } else if (Team_ID === awayTeam) {
                awayScore += Points;
            }
        }

        // Update the games table with the final scores
        await db.execute(
            'UPDATE games SET H_Team_Score = ?, A_Team_Score = ? WHERE Game_ID = ?',
            [homeScore, awayScore, gameId]
        );

        res.status(200).json({
            message: 'Game stats submitted successfully!',
            gameId,
            homeScore,
            awayScore,
        });
    } catch (error) {
        console.error('Error submitting game stats:', error);
        res.status(500).json({ message: 'Failed to submit game stats.' });
    }
}
