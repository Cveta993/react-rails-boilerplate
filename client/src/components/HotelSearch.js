import React, { useState } from 'react';
import axios from 'axios';

const HotelSearch = () => {
  const [city, setCity] = useState('');
  const [adults, setAdults] = useState(1);
  const [results, setResults] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleSearch = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const response = await axios.get('/api/hotels/search', {
        params: { city, adults }
      });
      setResults(response.data);
    } catch (error) {
      console.error('Error searching hotels:', error);
    }
    setLoading(false);
  };

  return (
    <div>
      <h2>Hotel Search</h2>
      <form onSubmit={handleSearch}>
        <div>
          <label>City:</label>
          <input
            type="text"
            value={city}
            onChange={e => setCity(e.target.value)}
            placeholder="Enter city"
            required
          />
        </div>
        <div>
          <label>Adults:</label>
          <input
            type="number"
            value={adults}
            onChange={e => setAdults(e.target.value)}
            min="1"
            required
          />
        </div>
        <button type="submit">Search</button>
      </form>
      {loading && <p>Loading...</p>}
      {results && (
        <pre>{JSON.stringify(results, null, 2)}</pre>
      )}
    </div>
  );
};

export default HotelSearch;