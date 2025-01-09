pipeline {
    agent { label 'windows-11-slave' }

    environment {
        // Define the location of the Git repository and credentials
        POSTMAN_COLLECTION = 'UserManagementAPITestForCI.postman_collection.json'   
        outputPath = "TestResults"
    }

    stages {

        stage('Run Postman Tests') {
            steps {
                // Run the Postman collection using Newman command-line tool
                bat "robot  --outputdir ${outputPath} --variable testing_type:web  -s Testcase_get_quote_for_automobile -s  Testcase_UserManagement_API  ./TestScripts" 
            }
        }
    }
    post {
        success {
            robot(outputPath: "${outputPath}",
                passThreshold: 90.0,
                unstableThreshold: 70.0,
                disableArchiveOutput: true,
                outputFileName: "output.xml",
                logFileName: 'log.html',
                reportFileName: 'report.html',
                countSkippedTests: true,   
            )
        }
    }
}
