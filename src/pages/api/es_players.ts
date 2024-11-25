// src/pages/api/players.ts
import { connectToDatabase } from '../../lib/db';
import type { NextApiRequest, NextApiResponse } from 'next';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    const { teamId } = req.query;
    try {
        const db = await connectToDatabase();
        const [players] = await db.query('SELECT Player_ID, Name FROM players WHERE Team_ID = ?', [teamId]);
        res.status(200).json(players);
    } catch (error) {
        console.error('Error fetching players:', error);
        res.status(500).json({ message: 'Failed to fetch players' });
    }
}
