const ip = window.location.hostname;
const url = "http://" + ip + ":5000/news"

fetch(url)
  .then(response => response.json())
  .then(data => {
    data.forEach(article => {
      const newsContainer = document.getElementById('news-container');

      const newsItem = document.createElement('div');
      newsItem.classList.add('news-item');

      const title = document.createElement('h2');
      title.classList.add('news-title');
      title.textContent = article[1];

      const content = document.createElement('p');
      content.classList.add('news-content');
      content.textContent = article[2];

      const date = document.createElement('p');
      date.classList.add('news-date');
      date.textContent = article[3];

      newsItem.appendChild(title);
      newsItem.appendChild(content);
      newsItem.appendChild(date);
      newsContainer.appendChild(newsItem);
    });
  })
  .catch(error => {
    console.log('An error occurred:', error);
  });