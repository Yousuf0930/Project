-- How many seats are in Indian Parliament
SELECT COUNT(Parliament_Constituency) AS Total_Seats
FROM constituencywise_results;
-- What are the total number of seats available for election in each states
SELECT s.state AS State_Name,
COUNT(cr.parliament_constituency) AS Total_Seats
FROM 
constituencywise_results cr
INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s ON s.state_id = sr.state_id
GROUP BY s.state;
--- Total seats won by NDA Alliance
SELECT 
	SUM(CASE
		WHEN party IN (
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Asom Gana Parishad - AGP',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM'
		) THEN [Won]
		ELSE 0
	END) AS NDA_Total_Seats_Won
FROM 
	partywise_results
--- Total seats won by NDA Alliance
SELECT 
Party as Party_Name,
Won as Seat_Won
FROM partywise_results
WHERE Party IN (
				'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Asom Gana Parishad - AGP',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM'
			)
ORDER BY Seat_Won DESC;
--- Total seats won by I.N.D.I.A Alliance
SELECT 
	SUM(CASE
			WHEN Party IN (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Nat`Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			) THEN [WON]
			ELSE 0
		END) as INDIA_Total_Seats
FROM partywise_results;

--- Total seats won by I.N.D.I.A Alliance Party

SELECT Party AS party_name,
		WON AS seat_won
		FROM partywise_results
		WHERE party IN (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Nat Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			)
			ORDER BY seat_won DESC;
--Add new column field in the table partywise_results to get the partry allianz as NDA,I.N.D.I.A and other
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE Party IN(
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP',
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Nat`Jammu & Kashmir National Conference - JKN',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			);
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE Party IN(
			'Bharatiya Janata Party - BJP',
			'Telugu Desam - TDP',
			'Janata Dal  (United) - JD(U)',
			'Shiv Sena - SHS',
			'AJSU Party - AJSUP',
			'Apna Dal (Soneylal) - ADAL',
			'Asom Gana Parishad - AGP',
			'Hindustani Awam Morcha (Secular) - HAMS',
			'Janasena Party - JnP',
			'Janata Dal  (Secular) - JD(S)',
			'Lok Janshakti Party(Ram Vilas) - LJPRV',
			'Nationalist Congress Party - NCP',
			'Rashtriya Lok Dal - RLD',
			'Sikkim Krantikari Morcha - SKM'
			);
UPDATE partywise_results
SET party_alliance = 'Other'
WHERE Party IS NULL;


SELECT
party_alliance,
SUM(Won) AS total_seats
FROM partywise_results
GROUP BY party_alliance;


SELECT
Party,
Won
FROM partywise_results
WHERE party_alliance = 'I.N.D.I.A'
ORDER BY Won DESC;

--Winning candidates name, their party name, total votes, and the margin of victory
--for a specific state and constituency?

SELECT
cr.Winning_Candidate,
pr.Party,
cr.Total_Votes,
cr.Margin,
s.State,
cr.Constituency_Name
FROM
constituencywise_results cr INNER JOIN partywise_results pr ON cr.Party_Id = pr.Party_Id
INNER JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
WHERE constituency_name = 'AGRA'

--What is the distribution of EVM votes versus Postal votes for candidates in a specific constituency?

SELECT
cd.Candidate,
cd.EVM_Votes,
cd.Postal_Votes,
cd.Total_Votes,
cr.Constituency_Name 
FROM
constituencywise_results cr JOIN
constituencywise_details cd ON
cr.Constituency_ID = cd.Constituency_ID
WHERE cr.Constituency_Name = 'BIDAR'

--Which party won the most seats in a state, and how many seats did each party win?

SELECT
	pr.Party,
	COUNT(cr.Constituency_Id) as Seats_Won
FROM
	constituencywise_results cr
JOIN
	partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN
	statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN
	states s ON s.State_Id = sr.State_ID
WHERE
	s.state = 'Andhra Pradesh'
GROUP BY
	pr.Party
ORDER BY
	Seats_Won DESC

--What is the total number of seats won by each party allinace (NDA, I.N.D.I.A and other)
--in each state for the india election 2024

SELECT 
	s.State,
	SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
	SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN pr.party_alliance = 'Other' THEN 1 ELSE 0 END) AS Other_Seats_Won
FROM
	constituencywise_results cr
JOIN
	partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN
	statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN
	states s ON s.State_ID = sr.State_ID
GROUP BY
	s.State

--Which candidate received the highest number EVM votes in each constituency (top10)

SELECT TOP 10
	cd.Candidate,
	cd.EVM_Votes,
	cd.Constituency_ID,
	cr.Constituency_Name
FROM
	constituencywise_results cr
JOIN
	constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
WHERE 
	cd.EVM_Votes = (
	SELECT MAX(cd1.EVM_Votes)
	FROM constituencywise_details cd1
	WHERE cd1.Constituency_ID = cd.Constituency_ID
	)
ORDER BY
	cd.EVM_Votes DESC

--Which candidate won and which candidate was runner up in each constituency of state
--for the 2024 election

WITH RankedCandidates AS (
	SELECT
		cd.Constituency_ID,
		cd.Candidate,
		cd.Party,
		cd.EVM_Votes,
		cd.Postal_Votes,
		cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
		ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
	FROM
		constituencywise_details cd
	JOIN
		constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
	JOIN
		statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
	JOIN 
		states s ON sr.State_ID = s.State_ID
	WHERE
		s.State = 'Bihar'
)
SELECT
	cr.Constituency_Name,
	MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
	MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM
	RankedCandidates rc
JOIN
	constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY
	cr.Constituency_Name
ORDER BY
	cr.Constituency_Name
