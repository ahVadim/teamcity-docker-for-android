# teamcity-docker-for-android
docker settings for TeamCity agent for building android projects

### Basic Setup

```bash
docker build -t teamcity-android-agent .
docker-compose -t teamcity-compose up teamcity-server teamcity-agent
```
