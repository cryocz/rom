import * as React from 'react';
import 'styles/HomePage.scss';

class HomePage extends React.Component {
  render() {
    return (
      <div className='home-page'>
        <img src={'public/images/homepage-background.jpg'} className='bg' />
        <h1>Grove Street. Home. At least it used to be until I f***ed everything up.</h1>
      </div>
    );
  }
}

export default HomePage;