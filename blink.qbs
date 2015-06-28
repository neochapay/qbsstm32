import qbs

Project{
    name: "blink"

    Product{
        name: "embedend stm32f4"
        Group{
            name: "stm32f4 core sources"
            files: "core/src/*.c"
            fileTags: ['c']
        }

        Group{
            name: "stm32f4 core headers"
            files: "core/include/*.h"
            fileTags: ['h']
        }

        files: [
            "blink.c",
            "lib/core_cmInstr.h",
            "lib/stm32f4_discovery.c",
            "lib/stm32f4_discovery.h",
            "lib/stm32f4xx.h",
            "lib/core_cm4.h",
        ]
        type: "application"

        Depends{
            name: "cpp"
        }

        cpp.includePaths: ['lib/','core/include/']
        cpp.defines: [
                "STM32F4XX",
                "STM32F40_41xxx",
                "HSE_VALUE=168000000",
            ]
        cpp.compilerName: ["arm-none-eabi-gcc"]
        cpp.compilerPath: ["/usr/bin/arm-none-eabi-gcc"]
        cpp.commonCompilerFlags: ["-march=cortex-m3"]
        cpp.architecture: "arm"

        Rule{
            inputs: ["с"]
            Artifact {
                fileTags: ['obj']
                filePath: '.obj/' + qbs.getHash(input.baseDir) + '/' + input.fileName + '.o'
            }
            prepare: {
                var compilerPath = "/usr/bin/msp430-elf-gcc"
                var cmd = new Command(compilerPath, args);
                cmd.description = "Compiling "+ input.fileName
                cmd.silent = false;
                cmd.highlight = "compiler";
                cmd.sourceCode = function() {
                    print("Nothing to do");
                };
                return cmd;
            }
        }
    }
}

