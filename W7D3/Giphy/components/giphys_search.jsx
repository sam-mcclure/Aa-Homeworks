import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSeach extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    this.setState({searchTerm: event.currentTarget.value});
  }

  handleSubmit(event){
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render () {
    return (
      <div>
        <label>Input a search term
          <input type="text" value={this.state.searchTerm} onChange={this.handleChange}>
          </input></label>
          <button type="submit" onClick={this.handleSubmit}>Search Giphy</button>
          <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }

}

export default GiphysSeach;
