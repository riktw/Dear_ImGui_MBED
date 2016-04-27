##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=testproject
ConfigurationName      :=Debug
WorkspacePath          := "/home/rik/Documents/Dear_ImGui"
ProjectPath            := "/home/rik/Documents/Dear_ImGui/testproject"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Rik
Date                   :=27/04/16
CodeLitePath           :="/home/rik/.codelite"
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="testproject.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  `pkg-config --static --libs glfw3` -lGL
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)./dear_imgui $(IncludeSwitch)./Serial 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -Wall   $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall   $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/imgui_impl_glfw.cpp$(ObjectSuffix) $(IntermediateDirectory)/dear_imgui_imgui.cpp$(ObjectSuffix) $(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(ObjectSuffix) $(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(ObjectSuffix) $(IntermediateDirectory)/Serial_list_ports_linux.cc$(ObjectSuffix) $(IntermediateDirectory)/Serial_serial.cc$(ObjectSuffix) $(IntermediateDirectory)/Serial_unix.cc$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(DependSuffix): main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/main.cpp$(DependSuffix) -MM "main.cpp"

$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) "main.cpp"

$(IntermediateDirectory)/imgui_impl_glfw.cpp$(ObjectSuffix): imgui_impl_glfw.cpp $(IntermediateDirectory)/imgui_impl_glfw.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/imgui_impl_glfw.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/imgui_impl_glfw.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/imgui_impl_glfw.cpp$(DependSuffix): imgui_impl_glfw.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/imgui_impl_glfw.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/imgui_impl_glfw.cpp$(DependSuffix) -MM "imgui_impl_glfw.cpp"

$(IntermediateDirectory)/imgui_impl_glfw.cpp$(PreprocessSuffix): imgui_impl_glfw.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/imgui_impl_glfw.cpp$(PreprocessSuffix) "imgui_impl_glfw.cpp"

$(IntermediateDirectory)/dear_imgui_imgui.cpp$(ObjectSuffix): dear_imgui/imgui.cpp $(IntermediateDirectory)/dear_imgui_imgui.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/dear_imgui/imgui.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dear_imgui_imgui.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dear_imgui_imgui.cpp$(DependSuffix): dear_imgui/imgui.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dear_imgui_imgui.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/dear_imgui_imgui.cpp$(DependSuffix) -MM "dear_imgui/imgui.cpp"

$(IntermediateDirectory)/dear_imgui_imgui.cpp$(PreprocessSuffix): dear_imgui/imgui.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dear_imgui_imgui.cpp$(PreprocessSuffix) "dear_imgui/imgui.cpp"

$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(ObjectSuffix): dear_imgui/imgui_demo.cpp $(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/dear_imgui/imgui_demo.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(DependSuffix): dear_imgui/imgui_demo.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(DependSuffix) -MM "dear_imgui/imgui_demo.cpp"

$(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(PreprocessSuffix): dear_imgui/imgui_demo.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dear_imgui_imgui_demo.cpp$(PreprocessSuffix) "dear_imgui/imgui_demo.cpp"

$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(ObjectSuffix): dear_imgui/imgui_draw.cpp $(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/dear_imgui/imgui_draw.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(DependSuffix): dear_imgui/imgui_draw.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(DependSuffix) -MM "dear_imgui/imgui_draw.cpp"

$(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(PreprocessSuffix): dear_imgui/imgui_draw.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dear_imgui_imgui_draw.cpp$(PreprocessSuffix) "dear_imgui/imgui_draw.cpp"

$(IntermediateDirectory)/Serial_list_ports_linux.cc$(ObjectSuffix): Serial/list_ports_linux.cc $(IntermediateDirectory)/Serial_list_ports_linux.cc$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/Serial/list_ports_linux.cc" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Serial_list_ports_linux.cc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Serial_list_ports_linux.cc$(DependSuffix): Serial/list_ports_linux.cc
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Serial_list_ports_linux.cc$(ObjectSuffix) -MF$(IntermediateDirectory)/Serial_list_ports_linux.cc$(DependSuffix) -MM "Serial/list_ports_linux.cc"

$(IntermediateDirectory)/Serial_list_ports_linux.cc$(PreprocessSuffix): Serial/list_ports_linux.cc
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Serial_list_ports_linux.cc$(PreprocessSuffix) "Serial/list_ports_linux.cc"

$(IntermediateDirectory)/Serial_serial.cc$(ObjectSuffix): Serial/serial.cc $(IntermediateDirectory)/Serial_serial.cc$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/Serial/serial.cc" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Serial_serial.cc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Serial_serial.cc$(DependSuffix): Serial/serial.cc
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Serial_serial.cc$(ObjectSuffix) -MF$(IntermediateDirectory)/Serial_serial.cc$(DependSuffix) -MM "Serial/serial.cc"

$(IntermediateDirectory)/Serial_serial.cc$(PreprocessSuffix): Serial/serial.cc
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Serial_serial.cc$(PreprocessSuffix) "Serial/serial.cc"

$(IntermediateDirectory)/Serial_unix.cc$(ObjectSuffix): Serial/unix.cc $(IntermediateDirectory)/Serial_unix.cc$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/rik/Documents/Dear_ImGui/testproject/Serial/unix.cc" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Serial_unix.cc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Serial_unix.cc$(DependSuffix): Serial/unix.cc
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Serial_unix.cc$(ObjectSuffix) -MF$(IntermediateDirectory)/Serial_unix.cc$(DependSuffix) -MM "Serial/unix.cc"

$(IntermediateDirectory)/Serial_unix.cc$(PreprocessSuffix): Serial/unix.cc
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Serial_unix.cc$(PreprocessSuffix) "Serial/unix.cc"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


