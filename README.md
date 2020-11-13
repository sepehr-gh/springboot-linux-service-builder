# springboot-linux-service-builder
Simple script that creates linux service for spring boot project. Script needs `systemd` support as these commands are used: `systemctl`, `service`.

You need a `springboot` user and group before you run this code. The generated service will be accessible by that group only, to prevent security flaws.

## Usage:

Clone this repository and move to the directory:

```
git clone https://github.com/sepehr-gh/springboot-linux-service-builder
cd springboot-linux-service-builder
```

Call `build.sh` and pass path to jar file and the service name you want to set. Remember, you wont need to keep $ sign,

```
./build.sh $pathToJar $serviceName
```

## Customization:

Edit contents of `example.service`.

## Note:

your spring application should already use `spring-boot-maven-plugin` to make it executable. Maven example:


```
<build>
<plugins>
    <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
        <version>2.1.1.RELEASE</version>
        <configuration>
            <executable>true</executable>
        </configuration>
        <executions>
            <execution>
                <goals>
                    <goal>repackage</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
</plugins>
<finalName>jar-name</finalName>
</build>
```

