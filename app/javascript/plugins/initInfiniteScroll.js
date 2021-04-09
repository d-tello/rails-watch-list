const infiniteScroll = () => {
  let InfiniteScroll = require("infinite-scroll");
  let elem = document.querySelector(".pagination-container");
  let infScroll = new InfiniteScroll(elem, {
    // options
    path: ".next_page",
    append: ".pagination-element",
    history: false,
  });
};

export { infiniteScroll };
