// pages/api/test-db.ts
import type { NextApiRequest, NextApiResponse } from 'next';
import { connectToDatabase } from '../../lib/db';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    try {
        const db = await connectToDatabase(); // Connect to the database
        await db.ping(); // Ping the database to test the connection
        res.status(200).json({ message: 'Database connection successful!' });
    } catch (error) {
        console.error('Database connection error:', error);
        res.status(500).json({ message: 'Database connection failed.' });
    }
}
