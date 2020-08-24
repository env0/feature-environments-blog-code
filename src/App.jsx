import React from "react";

const App = () => {
  return <div>
    <div class="jumbotron jumbotron-fluid">
      <div class="container">
        <h1 class="display-4">Welcome to the preview environment!</h1>
        <p class="lead">Don't panic, it's just a preview :)</p>
      </div>
    </div>
    <div class="container-fluid d-flex justify-content-center">
      <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
  </div>;
}

export default App;
