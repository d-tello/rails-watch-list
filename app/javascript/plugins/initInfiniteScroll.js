const infiniteScroll = () => {
  let InfiniteScroll = require("infinite-scroll");
  let elem = document.querySelector(".movies-container");
  let infScroll = new InfiniteScroll(elem, {
    // options
    path: ".next_page",
    append: ".movie-card",
    history: false,
  });
};

export { infiniteScroll };
