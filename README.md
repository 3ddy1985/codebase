# Project 4 - CodeBase

CodeBase is a social platform for coders to share, learn and connect with other coders. The app is built using Ruby on Rails and uses a PostgreSQL database. The app allows users to sign up, create a profile, add code snippets to their profile, post questions, and engage in conversations.

### Initial Project
The initial project met the requirements, including full CRUD for at least one of the models. However, some features were implemented using a more complex approach than necessary. For example, I used xhr instead of Turbo Rails and Action Cable. Despite the challenges, there were some sections of code that I was proud of, and I learned valuable lessons from the process.

### Rebuilding Project
I am currently rebuilding the app, applying the learnings from the initial project to make it more efficient and streamlined. The updated app will be showcased on my portfolio, CV, and LinkedIn once completed.

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

## Features
As I have a limited timescale, I have split the build features into an MVP and additional features. I have done this to make sure I have a fully working CRUD app to present at the end of project week.

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


## User Stories:
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


### ERD: 
https://lucid.app/documents/view/cfe4a7f6-736a-4284-858f-76e3649ef3ed

### basic wireframe:
https://www.figma.com/file/q5hif8fpInr2mLk6TR3zCD/Developer-app?node-id=6%3A5&t=zbHIn21JtxVtotjJ-1

### Reflections
Throughout the development of the initial project, I learned valuable lessons about the importance of using appropriate tools and techniques to streamline code. While I faced challenges in implementing some features using more complex methods than necessary, I am proud of certain sections of code that I wrote.

In the rebuilt app, I will apply my learnings from the initial project to create a more efficient and streamlined application. The updated app will be showcased on my portfolio, CV, and LinkedIn once completed.

### Code I'm Proud of
Despite the fact that the functionality could have been achieved through simpler means, I invested a considerable amount of effort and time in creating this code, and it presented a formidable challenge that tested my programming skills. While the end result may not have been strictly necessary, the process of developing and refining the code was an enriching experience that allowed me to grow and expand my knowledge in the field of software development.

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


