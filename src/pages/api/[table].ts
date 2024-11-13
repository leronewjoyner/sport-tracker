import type { NextApiRequest, NextApiResponse } from 'next';
import { connectToDatabase } from '../../lib/db';

export default async function handler(
    req: NextApiRequest,
    res: NextApiResponse
) {
    const { table } = req.query; // Extract the table name from the query parameter

    try {
        const db = await connectToDatabase();

        // Validate the table name to prevent SQL injection
        const validTables = ['teams', 'players', 'coaches', 'games', 'team_stats', 'player_stats'];
        if (!validTables.includes(table as string)) {
            return res.status(400).json({ message: 'Invalid table name' });
        }

        // Query the database dynamically based on the table name
        const [data] = await db.query(`SELECT * FROM ??`, [table]);
        res.status(200).json(data);
    } catch (error) {
        console.error('Database query error:', error);
        res.status(500).json({ message: 'Error fetching data' });
    }
}