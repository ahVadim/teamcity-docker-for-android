FROM jetbrains/teamcity-agent

ENV SDK_URL "https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip"

RUN cd /home/buildagent && \
    mkdir android-sdk && \
    cd ./android-sdk && \
    mkdir cmdline-tools && \
    cd ./cmdline-tools && \
    curl -o sdk.zip $SDK_URL && \
    unzip sdk.zip && \
    rm sdk.zip && \
    mv cmdline-tools tools

ENV ANDROID_SDK_ROOT "/home/buildagent/android-sdk"

ENV PATH ${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin
RUN sdkmanager --update && \
    yes | sdkmanager --licenses && \
    sdkmanager "build-tools;29.0.3" "platforms;android-29" "platform-tools"