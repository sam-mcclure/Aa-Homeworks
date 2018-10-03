import React from 'react';
import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({ giphys}) {
  let GiphysIndexItems = giphys.map(giphy =>
  <GiphysIndexItem key={giphy.id} giphy={giphy} />);
  return (
    <ul>
      {GiphysIndexItems}
    </ul>
  );
}

export default GiphysIndex;
