
@Library('jenkins-shared-libs') _

try {
        baseImagePipeline {
                // Constants
                imageName = 'jdk11-test-runner-base'
                imageTag = 'latest'
        }
} catch (err) {
        echo "Exception: ${err}"
    /* Rethrow to fail the Pipeline properly */
        throw err
}