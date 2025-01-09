pipeline {
    agent { label 'windows-11-slave' }

    environment {
        // Define the location of the Git repository and credentials
        POSTMAN_COLLECTION = 'UserManagementAPITestForCI.postman_collection.json'   
        JUNIT_REPORT = "./*.xml"
    }

    stages {

        stage('Run Postman Tests') {
            steps {
                // Run the Postman collection using Newman command-line tool
                bat "robot  --outputdir ./TestResults --variable testing_type:web  -s Testcase_get_quote_for_automobile -s  Testcase_UserManagement_API  ./TestScripts" 
            }
        }
    }

    post {
        success {
            // Publish JUnit test results from Newman only when pass
            junit "${JUNIT_REPORT}"
        }
    }
}
