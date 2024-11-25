import { useState, useEffect } from 'react';

const EnterStats = () => {
    const [teams, setTeams] = useState([]);
    const [players, setPlayers] = useState({});
    const [selectedTeams, setSelectedTeams] = useState({ home: '', away: '' });
    const [gameDate, setGameDate] = useState('');
    const [gameStats, setGameStats] = useState([]);
    const [teamScores, setTeamScores] = useState({ home: 0, away: 0 });

    // Fetch teams on component load
    useEffect(() => {
        const fetchTeams = async () => {
            const response = await fetch('/api/es_teams');
            const data = await response.json();
            setTeams(data);
        };
        fetchTeams();
    }, []);

    // Fetch players for a team
    const handleTeamChange = async (teamId, type) => {
        setSelectedTeams((prev) => ({ ...prev, [type]: teamId }));

        // Fetch players for the selected team
        const response = await fetch(`/api/es_players?teamId=${teamId}`);
        const data = await response.json();
        setPlayers((prev) => ({ ...prev, [type]: data }));
    };

    // Handle player point changes
    const handlePlayerStatChange = (playerId, points, teamType) => {
        points = parseInt(points, 10) || 0;

        // Update game stats
        setGameStats((prev) => {
            const existingStat = prev.find((stat) => stat.Player_ID === playerId);
            if (existingStat) {
                return prev.map((stat) =>
                    stat.Player_ID === playerId ? { ...stat, Points: points } : stat
                );
            } else {
                return [...prev, { Player_ID: playerId, Points: points, Team_ID: selectedTeams[teamType] }];
            }
        });

        // Update team scores
        setTeamScores((prev) => {
            const teamKey = teamType === 'home' ? 'home' : 'away';
            const otherKey = teamType === 'home' ? 'away' : 'home';

            // Calculate the updated score for the current team
            const updatedScore = gameStats
                .filter((stat) => stat.Team_ID === selectedTeams[teamType] && stat.Player_ID !== playerId)
                .reduce((acc, stat) => acc + stat.Points, 0) + points;

            return { ...prev, [teamKey]: updatedScore };
        });
    };

    const handleSubmit = async () => {
        const response = await fetch('/api/submit-stats', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                gameDate,
                homeTeam: selectedTeams.home,
                awayTeam: selectedTeams.away,
                stats: gameStats,
            }),
        });

        if (response.ok) {
            const result = await response.json();
            alert(`Game Submitted! Final Scores:\nHome: ${result.homeScore}\nAway: ${result.awayScore}\nWinner: ${result.winner}`);
        } else {
            alert('Failed to submit stats.');
        }
    };

    return (
        <div>
            <h1>Enter Game Stats</h1>

            <label>Game Date:</label>
            <input type="date" value={gameDate} onChange={(e) => setGameDate(e.target.value)} />

            <h2>Select Teams</h2>
            <label>Home Team:</label>
            <select value={selectedTeams.home} onChange={(e) => handleTeamChange(e.target.value, 'home')}>
                <option value="">Select a team</option>
                {teams.map((team) => (
                    <option key={team.Team_ID} value={team.Team_ID}>
                        {team.Team_Name}
                    </option>
                ))}
            </select>

            <label>Away Team:</label>
            <select value={selectedTeams.away} onChange={(e) => handleTeamChange(e.target.value, 'away')}>
                <option value="">Select a team</option>
                {teams.map((team) => (
                    <option key={team.Team_ID} value={team.Team_ID}>
                        {team.Team_Name}
                    </option>
                ))}
            </select>

            <h2>Enter Player Stats</h2>
            <div>
                <h3>Home Team Total Score: {teamScores.home}</h3>
                {players.home &&
                    players.home.map((player) => (
                        <div key={player.Player_ID}>
                            <label>{player.Name}:</label>
                            <input
                                type="number"
                                min="0"
                                style={{ border: '1px solid black' }}
                                onChange={(e) =>
                                    handlePlayerStatChange(player.Player_ID, e.target.value, 'home')
                                }
                            />
                        </div>
                    ))}
            </div>
            <div>
                <h3>Away Team Total Score: {teamScores.away}</h3>
                {players.away &&
                    players.away.map((player) => (
                        <div key={player.Player_ID}>
                            <label>{player.Name}:</label>
                            <input
                                type="number"
                                min="0"
                                style={{ border: '1px solid black' }}
                                onChange={(e) =>
                                    handlePlayerStatChange(player.Player_ID, e.target.value, 'away')
                                }
                            />
                        </div>
                    ))}
            </div>

            <button 
                onClick={handleSubmit} 
                className="bg-green-500 text-white py-2 px-4 rounded mt-5 hover:bg-green-700"
            >
                Submit Game Stats
            </button>
        </div>
    );
};

export default EnterStats;
