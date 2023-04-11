# Project 4 - CodeBase

CodeBase is a social platform for coders to share, learn and connect with other coders. The app is built using Ruby on Rails and uses a PostgreSQL database. The app allows users to sign up, create a profile, add code snippets to their profile, post questions, and engage in conversations.

### Initial Project
The initial project met the requirements, including full CRUD for at least one of the models. However, some features were implemented using a more complex approach than necessary. For example, I used xhr instead of Turbo Rails and Action Cable. Despite the challenges, there were some sections of code that I was proud of, and I learned valuable lessons from the process.

### Rebuilding Project
I am currently rebuilding the app, applying the learnings from the initial project to make it more efficient and streamlined. The updated app will be showcased on my portfolio, CV, and LinkedIn once completed.

### Deployment Link
The deployed project can be found at https://infinite-garden-21771.herokuapp.com/

### Timeframe & Working Team
This project was completed individually over a period of 1 week

### Technologies Used
* Ruby on Rails
*  PostgreSQL
* HTML
* CSS
* JavaScript
* Heroku (for deployment)

## Brief
- **Build a full stack web application**. Must be your own work.
- **Select a Project Idea of your own**.
- Have at _least_ 2 models (more if it makes sense)
  - Auth is a **requirement**
- Have full CRUD on at _least_ one of your models
- Be able to Add/Delete on any remaining models
- Have high quality code:
    - Follow accepted naming conventions
    - Consistent indentation
    - Well-structured and readable code
    - Semantic naming of variables, functions, CSS classes, etc.
    - Short and clear functions that _do one thing_
    - Efficient code - if you have your MVP, refactor
    - DRY (Don't Repeat Yourself) code
- **Use one of these technology stacks**. You may choose which tech stack.
  - Full-Stack Rails App
  - Rails API with React Front-End
  - Express API with React Front-End
- Be deployed on Heroku or similar platform
- **Craft a `README.md` file that explains your app**.
- Timeframe - One week

### Features
As I had a limited timescale, I decided to split the build features into an MVP and additional features. This was done to ensure that I had a fully functional CRUD app to present at the end of the project week.

### MVP:
- User registration and login
- User profile creation and editing
- Code snippet creation and storage for users
- Basic search functionality for code snippets
- Posting and commenting on questions and code snippets

### Additional features:
- Group & private chat functionality
- Advanced search functionality for questions and code snippets
- Social sharing and follow features for users
- Integration with external APIs to enhance search results


### User Stories:
- As a new user, I want to be able to create an account with a unique username and password so that I can access the features of the app.
- As a user, I want to be able to log in and log out of my account so that I can securely access my saved code snippets and posts.
- As a user, I want to be able to create a profile with information about myself, such as my name, profile picture, and bio, so that other users can learn more about me.
- As a user, I want to be able to search for questions or code snippets on the app to find information relevant to my coding needs.
- As a user, I want to be able to save code snippets to my profile for my personal reference.
- As a user, I want to be able to add tags or categories to my saved code snippets to make them easier to search for later.
- As a user, I want to be able to view and edit my saved code snippets and profile information at any time.
- As a user, I want to be able to delete my saved code snippets and profile information if I no longer need them.
- As a user, I want to be able to create posts with questions or code snippets so that I can share my knowledge and seek help from other users.
- As a user, I want to be able to comment on posts made by other users to provide answers, feedback, or additional information.
- As a user, I want to be able to follow other users and receive notifications when they create new posts or comment on existing ones.
- As a user, I want to be able to receive notifications when someone comments on my posts or replies to my comments.

### Planning
As I had a lot to accomplish within a week, I aimed to optimize my planning process. While I allocated a significant portion of my time to developing an Entity-Relationship Diagram (ERD), I recognized its value in ensuring clarity around the desired structure of my database and the connections between its tables.

ERD: 
![alt text](https://github.com/3ddy1985/codebase/blob/main/codebase_erd.png?raw=true)

Wireframe:
![alt text](https://github.com/3ddy1985/codebase/blob/main/codebase_wireframe.png?raw=true)

### Build/Code Process:
The app's core functionality was implemented using Ruby on Rails, with models for users, code languages, and questions. The user interface was built using HTML, CSS, and JavaScript for dynamic interactions. The app leverages the Devise gem for authentication and authorization.

Some code snippets I'm particularly proud of include:


1. Developer Language Preferences
```js
document.addEventListener('DOMContentLoaded', function() {  
  const selectLanguageBtn = document.getElementById('select-language-btn');
  const userId = selectLanguageBtn.dataset.userId;
  const popup = document.getElementById('language-popup');
  const languageList = popup.querySelector('ul');
  
  
  // Function to get the user's selected connections from the server
  function getSelectedLanguages() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', '/users/' + userId + '/connections', true);
    xhr.onload = function() {
      if (xhr.status >= 200 && xhr.status < 400) {
        const languages = JSON.parse(xhr.responseText);
        languages.forEach(function(language) {
          const li = document.createElement('li');
          li.dataset.id = language.id; // Set the dataset.id attribute
          li.textContent = language.name;
          languageList.appendChild(li);
        });
      }
    };
    xhr.send();
  }
  
  // Function to add or remove a language from the user's collection
  function updateLanguageCollection(languageId, addLanguage) {
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/users/' + userId + '/language_collections', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.setRequestHeader('X-CSRF-Token', Rails.csrfToken());
    if (!addLanguage) {
      xhr.setRequestHeader('X-HTTP-Method-Override', 'delete');
    }
    xhr.onload = function() {
      if (xhr.status >= 200 && xhr.status < 400) {
        const language = JSON.parse(xhr.responseText);
        const selectedLanguageItem = document.querySelector('.language-item[data-language-id="' + language.id + '"]');
        if (addLanguage) {
          selectedLanguageItem.classList.add('selected');
          const selectedLanguages = document.getElementById('selected-languages');
          const buttonHTML = '<button class="language-button" data-language-id="' + language.id + '">' + language.name + '</button>';
          selectedLanguages.insertAdjacentHTML('beforeend', buttonHTML);
        } else {
          selectedLanguageItem.classList.remove('selected');
          const selectedLanguages = document.getElementById('selected-languages');
          const button = selectedLanguages.querySelector('.language-button[data-language-id="' + language.id + '"]');
          button.remove();
        }
      }
    };
    xhr.send('language_id=' + languageId);
  }
  
  
  // When the page loads, get the user's selected languages from the server
  getSelectedLanguages();
  
  // When the select language button is clicked, show the language popup
  selectLanguageBtn.addEventListener('click', function() {
    popup.classList.remove('hidden');
  });
  
  // When a language item in the popup is clicked, add or remove the language from the user's collection
  popup.addEventListener('click', function(e) {
    if (e.target.tagName === 'LI') {
      const languageId = e.target.dataset.languageId;
      updateLanguageCollection(languageId, !e.target.classList.contains('selected'));
    }
    if (e.target.id === 'close-languages-dialog-btn') {
      popup.classList.add('hidden');
      // Clear the list of selected languages
      // languageList.innerHTML = '';
      // Refresh the list of selected languages from the server
      fetch('/users/' + userId + '/my_languages')
        .then(response => response.text())
        .then(html => {
          const selectedLanguages = document.getElementById('selected-languages');
          selectedLanguages.innerHTML = html;
        });
    }
  });

  
  // When a language button in the my languages section is clicked, remove the language from the user's collection
  document.addEventListener('click', function(e) {
    if (e.target.classList.contains('language-button')) {
      const languageId = e.target.dataset.languageId;
      updateLanguageCollection(languageId, false);
    }
  });
  
  // When a remove button is clicked next to a language in the popup, remove the language from the user's collection
  popup.addEventListener('click', function(e) {
    if (e.target.classList.contains('remove-language')) {
      e.preventDefault();
      const listItem = e.target.closest('li');
      const languageId = listItem.dataset.languageId;
      listItem.remove();
      updateLanguageCollection(languageId, false);
    }
  });
});
```
This is a JavaScript code that adds interactivity to a webpage that allows users to select and manage their language preferences. The code listens for user actions such as clicking on a button or a language item, sends requests to the server to retrieve or update user data, and dynamically updates the webpage content to reflect the changes. The code uses techniques such as AJAX and event listeners to enable a seamless user experience.

2. Language collections
```js
class LanguageCollectionsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    @language = Language.find(params[:language_id])
    @user.languages << @language
    render json: @language
  end

  def delete
    language_collection = LanguageCollection.find_by(user_id: params[:id], language_id: params[:id])
    if language_collection.destroy
      flash[:notice] = "Language removed successfully."
      render :main
    else
      flash[:alert] = "There was an error removing the language."
      render :main
    end

  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
```

The controller defines two actions: create and delete. The create action adds a new language to the user's collection and returns the added language as a JSON object. The delete action removes a language from the user's collection and redirects to the main page with a flash message indicating the success or failure of the operation. The controller also defines a private method to set the user object based on the user_id parameter.

### Challenges:
1. Utilizing Devise and adding custom fields:  
  One of the challenges I faced was integrating Devise for authentication and adding custom fields to the user model. To overcome this, I spent time understanding the Devise documentation and learning how to customize the registration process. By generating the Devise views, I was able to add custom fields to the registration form and update the user model and controller accordingly.

2. Learning and implementing XHR (XMLHttpRequest):  
  Another challenge was learning about XHR and implementing it in the app to enable asynchronous communication between the front-end and back-end. I had to familiarize myself with the concept of AJAX and how to use XHR to make asynchronous requests. I then implemented XHR to update parts of the web page without requiring a full page refresh, improving the user experience.
  
### Wins:
1. Progress despite learning on the go:  
  One of my biggest wins for this project was the progress I made despite having to learn new concepts and technologies as I went along. Tackling the challenges of integrating Devise with custom fields and implementing XHR taught me valuable lessons in problem-solving and adaptability. This experience showed me that I am capable of learning quickly and applying new knowledge effectively.

2. Writing complex code:  
  Another win was successfully writing more complex code for the app, which demonstrates my growth as a developer. The code snippets I provided earlier, such as the models, views, and JavaScript functions, show that I am capable of understanding and implementing advanced programming concepts. This accomplishment has boosted my confidence in my ability to take on more complex projects in the future.  

Overall, these wins emphasize my ability to learn and adapt while working on a project. They also highlight my growth as a developer and the progress I have made in understanding and implementing advanced programming concepts.

### Key Learnings/Takeaways:
1. Evaluating the best approach:  
  One of the key takeaways from this project is the importance of evaluating different options and choosing the most efficient and effective approach. In this case, I learned that using XHR might not have been the best option when there were alternatives like Action Cable and Turbo Rails available. These options could have potentially simplified the implementation process and provided the same functionality without the need to code everything from scratch.

2. Leveraging existing solutions:  
  Another important learning is the value of leveraging existing solutions and libraries to streamline development. By utilizing tools like Action Cable and Turbo Rails, I could have saved time and effort while achieving the same results. This lesson underscores the importance of staying up-to-date with the latest technologies and tools in the development ecosystem and understanding how they can be applied to improve the efficiency of the development process.

3. Balancing learning and productivity:  
  This project also highlighted the need to strike a balance between learning new concepts and maintaining productivity. While learning and implementing XHR was valuable from an educational standpoint, considering alternative solutions might have led to a more efficient development process. Going forward, I will aim to carefully weigh the benefits of learning new technologies against the potential impact on productivity and project timelines.  

These key learnings and takeaways will serve as valuable insights for future projects, helping me make informed decisions about the technologies and approaches I choose to employ. This will ultimately contribute to my growth as a developer and my ability to create more efficient and effective applications.

### Future Improvements:
1. Rebuilding the app using modern and efficient methods:  
  For future improvements, I plan to rebuild the app to take advantage of more modern and efficient methods while still keeping it as a full-stack Ruby on Rails application. This will allow me to optimize the app's performance, maintainability, and ease of development.

2. Adding private and group chat functionality:  
  To enhance collaboration and communication among users, I will implement private and group chat features. This will enable users to discuss their code snippets, questions, and solutions in real-time, fostering a more interactive and supportive community.

3. Implementing search functionality with web scraping:  
  I will add a search feature that allows users to search for questions or keywords in the app's database. In addition to searching the local database, the search feature will also use web scrapers to retrieve the best possible answers from external sources. This will provide users with a more comprehensive and accurate set of results for their queries.

4. Adding a connections feature:  
  To further encourage networking and collaboration among users, I plan to implement a feature that allows users to add other users as connections. This will enable users to easily keep track of their peers, share code snippets, and collaborate on questions or projects.

5. Integrating job posting functionality:  
  Another potential improvement is the integration of job posting functionality within the app. This feature will allow users to share and discover job opportunities in the development field, making the platform more valuable as a resource for professional growth.  

By implementing these improvements and features, the app will become a more versatile and powerful tool for developers, fostering collaboration, knowledge sharing, and professional development. This will ultimately help the app to better serve its user base and facilitate the growth of a thriving and supportive community of developers.
