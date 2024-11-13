import { useState, useEffect } from 'react';

const IndexPage = () => {
    const [selectedTable, setSelectedTable] = useState<string>('teams');
    const [data, setData] = useState<any[]>([]);
    const [error, setError] = useState<string | null>(null);

    // Fetch data based on the selected table
    useEffect(() => {
        if (!selectedTable) return;

        const fetchData = async () => {
            try {
                const response = await fetch(`/api/${selectedTable}`);
                if (!response.ok) throw new Error(`Failed to fetch data from ${selectedTable}`);
                const fetchedData = await response.json();
                setData(fetchedData);
            } catch (err) {
                setError((err as Error).message);
            }
        };
        fetchData();
    }, [selectedTable]);

    const handleTableChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        setSelectedTable(event.target.value);
        setError(null); // Reset error on table change
        setData([]); // Clear previous data when table changes
    };

    return (
        <div>
            <h1>Sport Tracker</h1>

            <label htmlFor="table-select">Choose a table to display:</label>
            <select id="table-select" value={selectedTable} onChange={handleTableChange}>
                <option value="teams">Teams</option>
                <option value="players">Players</option>
                <option value="coaches">Coaches</option>
                <option value="games">Games</option>
                <option value="team_stats">Team Stats</option>
                <option value="player_stats">Player Stats</option>
            </select>

            {error ? (
                <p style={{ color: 'red' }}>Error: {error}</p>
            ) : (
                <table>
                    <thead>
                        <tr>
                            {/* Dynamically render table headers based on data keys */}
                            {data.length > 0 &&
                                Object.keys(data[0]).map((key) => (
                                    <th key={key}>{key}</th>
                                ))}
                        </tr>
                    </thead>
                    <tbody>
                        {/* Dynamically render table rows and cells */}
                        {data.map((row, index) => (
                            <tr key={index}>
                                {Object.values(row).map((value, idx) => (
                                    <td key={idx}>{value}</td>
                                ))}
                            </tr>
                        ))}
                    </tbody>
                </table>
            )}
        </div>
    );
};

export default IndexPage;
