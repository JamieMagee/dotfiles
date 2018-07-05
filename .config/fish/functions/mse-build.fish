function mse-build -d "An efficient maven build command"
    set LOG_FILE "/tmp/mse_build_"(date +%Y-%m-%d_%H%M%S)".log"
    echo "Build in progress..."
    spin "mvn -T 1C -DskipDebianPackaging=true -Dsindbad.profile=dev -DskipJavadoc=true -DargLine=\"-Xmx6g\" -P dev clean package > $LOG_FILE 2>&1"
    tail $LOG_FILE
end

