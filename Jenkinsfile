node("maven") 
{
    stage("Checkout") {
     git url: "https://github.com/wasanthag/java-web-server.git", branch: "master"
     }
    stage("Build JAR") {
      sh "mvn clean package"
      stash name:"jar", includes:"target/java-web-server-1.0-SNAPSHOT.jar"
      }
  }
node {
      stage("Build Image") {
        unstash name:"jar"
        sh "oc start-build java-web-server --from-file=target/java-web-server-1.0-SNAPSHOT.jar -n jenkins"
        timeout(time: 5, unit: 'MINUTES') {
           openshift.withCluster() {
             openshift.withProject() {
               def nb = openshift.newBuild( "https://github.com/wasanthag/java-web-server", "--name=java-web-server" )

               // Print out information about the objects created by newBuild
               echo "newBuild created: ${nb.count()} objects : ${nb.names()}"

               // Filter non-BuildConfig objects and create selector which will find builds related to the BuildConfig
               def builds = nb.narrow("bc").related( "builds" )

        // Raw watch which only terminates when the closure body returns true
               builds.watch {
            // 'it' is bound to the builds selector.
            // Continue to watch until at least one build is detected
               if ( it.count() == 0 ) {
                   return false
            }
            // Print out the build's name and terminate the watch
               echo "Detected new builds created by buildconfig: ${it.names()}"
               return true
        }

        echo "Waiting for builds to complete..."

        // Like a watch, but only terminate when at least one selected object meets condition
        builds.untilEach {
            return it.object().status.phase == "Complete"
}
             }
            }  
          }
        }
}
