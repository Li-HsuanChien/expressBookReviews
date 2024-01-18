# Book Review App

## Overview
  The key features of the app include authorization, searching for books based on title, author, or ID, and the ability to add, edit, delete, and read reviews for each book.

## Getting Started

### Prerequisites

- [Python](https://www.python.org/) installed
- [Node.js](https://nodejs.org/en/) installed on your machine.
- [npm (Node Package Manager)](https://www.npmjs.com/) installed.

### Running the App

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Li-HsuanChien/expressBookReviews.git
    ```

2. Navigate to the project directory:

    ```bash
    cd book_review_app
    ```

3.  Set up a virtual environment (optional but recommended):

    ```bash
    python -m venv venv
    ```

4. Activate the virtual environment:

    - On Windows:

    ```bash
    venv\Scripts\activate
    ```

    - On Linux/macOS:

    ```bash 
    source venv/bin/activate
    ```

5. Install the required dependencies:

    ```bash
    npm install 
    ```

6. Run the application:

    ```bash
    npm start
    ```
7. The application will be listening to `http://localhost:5000/` by default.

## Usage

### API Endpoints

#### **Functionality 1**

- **Endpoint:**
  - `/`

- **Method:**
  - `GET`

- **Description:**
  -  diaplay list of books available in the shop using json

- **Parameters:**
  - List any query parameters or request body parameters, if applicable.

- **Example:**
  - Request:
    ```bash
    curl http://localhost:5000/
    ```

    Response:
    ```json
    {
     "1": {
          "author": "Chinua Achebe",
          "title": "Things Fall Apart",
          "reviews": {
              "shane": "I like it",
              "Jason": "not bad"
          }
      },
      "2": {
          "author": "Hans Christian Andersen",
          "title": "Fairy tales",
          "reviews": {}
      },
      "3": {
          "author": "Dante Alighieri",
          "title": "The Divine Comedy",
          "reviews": {}
      },
      "4": {
          "author": "Unknown",
          "title": "The Epic Of Gilgamesh",
          "reviews": {}
      },
      "5": {
          "author": "Unknown",
          "title": "The Book Of Job",
          "reviews": {}
      },
      "6": {
          "author": "Unknown",
          "title": "One Thousand and One Nights",
          "reviews": {}
      }
    }
    ```

#### **Functionality 2**

- **Endpoint:**
  - `/isbn/:isbn`

- **Method:**
  - `GET`

- **Description:**
  -  returns the book details with inputed id in json

- **Parameters:**
  - **URL Parameter:**
    - `id`: id of the target book.

- **Example:**
  - Request:
    ```bash
    curl http://localhost:5000/id/1
    ```

    Response:
    ```json
    {"author":"","title":"Things Fall Apart","reviews":{"shane":"I like it","Jason":"not bad"}}
    ```
#### **Functionality 3**

- **Endpoint:**
  - `/author/:author`

- **Method:**
  - `GET`

- **Description:**
  -  returns the all books with following author and their details in json

- **Parameters:**
  - **URL Parameter:**
    - author: author name of target book.

- **Example:**
  - Request:
    ```bash
    curl http://localhost:5000/author/Unknown
    ```

    Response:
    ```json
    [
      {
          "author": "Unknown",
          "title": "The Epic Of Gilgamesh",
          "reviews": {}
      },
      {
          "author": "Unknown",
          "title": "The Book Of Job",
          "reviews": {}
      },
      {
          "author": "Unknown",
          "title": "One Thousand and One Nights",
          "reviews": {}
      }
    ]
    ```
#### **Functionality 4**

- **Endpoint:**
  - `/title/:title`

- **Method:**
  - `GET`

- **Description:**
  -  returns the all books with following title and their details in json

- **Parameters:**
  - **URL Parameter:**
    - `title`: title of the target book.

- **Example:**
  - Request:
    ```bash
    curl http://localhost:5000/title/Things%20Fall%20Apart
    ```

    Response:
    ```json
    [
      {
        "author": "Chinua Achebe",
        "title": "Things Fall Apart",
        "reviews": {
            "shane": "I like it",
            "Jason": "not bad"
          }
      }
    ]
    ```
#### **Functionality 5**

- **Endpoint:**
  - `/review/:id`

- **Method:**
  - `GET`

- **Description:**
  -  returns the book reviews based on id provided

- **Parameters:**
  - **URL Parameter:**
    - `id`: id of the target book.

- **Example:**
  - Request:
    ```bash
    curl http://localhost:5000/review/1
    ```

    Response:
    ```json
    {"shane":"I like it","Jason":"not bad"}
    ```
#### **Functionality 6**

- **Endpoint:**
  - `/register`

- **Method:**
  - `POST`

- **Description:**
  -  register username and password in the system

- **Parameters:**
  -**JSON File in request body:**
  ```json
    {
      "username":<:your_username>,
      "password":<:your_password>
    }
  ```

- **Example:**
  - Request:
    ```bash
    curl -X POST -d "{\"username\": \"samplename\", \"password\": \"sample121password\"}" -H "Content-Type: application/json" http://localhost:5000/register
    ```
    Response:
    ```json
    { "message": `User samplename successfully registred. Now you can login` }
    ```
#### **Functionality 7**

- **Endpoint:**
  - `/customer/login`

- **Method:**
  - `POST`

- **Description:**
  - Register username and password in the system.

- **Parameters:**
  - **JSON File in Request Body:**
    ```json
    {
      "username": "your_username",
      "password": "your_password"
    }
    ```

- **Example:**
  - Request:
    ```bash
    curl -X POST -d "{\"username\": \"samplename\", \"password\": \"sample121password\"}" -H "Content-Type: application/json" http://localhost:5000/customer/login
    ```

    Response:
    ```json
    { "message": "User samplename successfully logged in" }
    ```

#### **Functionality 8**

- **Endpoint:**
  - `/customer/auth/review/:id`

- **Method:**
  - `POST/PUT`

- **Description:**
  - Add a review for a book with the specified id. Requires authentication.

- **Parameters:**
  - **URL Parameter:**
    - `id`: id of the target book.
  - **JSON File in Request Body:**
    ```json
    {
      "review": "Your review text"
    }
    ```

- **Example:**
  - Request:
  - POST:
    ```bash
    curl -X POST -d '{"review": "Great book!"}' -H "Content-Type: application/json" -H "Authorization: Bearer YOUR_ACCESS_TOKEN" http://localhost:5000/customer/auth/review/1
    ```
  - PUT:
    ```bash
    curl -X PUT -d '{"review": "Great book!"}' -H "Content-Type: application/json" -H "Authorization: Bearer YOUR_ACCESS_TOKEN" http://localhost:5000/customer/auth/review/1
    ```

    Response:
    ```json
    { "message": "The review of ID 1 has been added/modified"}
    ```

#### **Functionality 9**

- **Endpoint:**
  - `/customer/auth/review/:id`

- **Method:**
  - `DELETE`

- **Description:**
  - Delete the review of the authenticated user for the specified book id.

- **Parameters:**
  - **URL Parameter:**
    - `id`: id of the target book.

- **Example:**
  - Request:
    ```bash
    curl -X DELETE http://localhost:5000/customer/auth/review/1
    ```

    Response:
    ```json
    {
      "message": "Review deleted successfully"
    }
    ```
  
    
## Awaiting Updates

1. **Add front end interactive page**
   - Create dynamic pages

2. **Allow adding Customizing books**
   - allow taking books inputs to add more books in the system

3. **Hosting Website**
   - hosting website on the cloud

## Contributing

Feel free to contribute to the development of this budget management system by creating issues or pull requests.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
