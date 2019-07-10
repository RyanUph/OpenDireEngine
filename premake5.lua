workspace "OpenDireEngine"
	architecture "x64"
	configurations { "Debug", "Release" }

	startproject "OpenDireEngine"

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	IncludeDir = {}
	IncludeDir["GLFW"] = "OpenDireEngine/vendor/GLFW/include"
	IncludeDir["Glad"] = "OpenDireEngine/vendor/Glad/include"
	IncludeDir["glm"] = "OpenDireEngine/vendor/glm"
	IncludeDir["ImGui"] = "OpenDireEngine/vendor/imgui"

	include "OpenDireEngine/vendor/GLFW"
	include "OpenDireEngine/vendor/Glad"
	include "OpenDireEngine/vendor/imgui"

project "OpenDireEngine"
	location "OpenDireEngine"
	kind "ConsoleApp"
	language "C++"
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	systemversion "latest"
	
	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
		"%{prj.name}/vendor/stb_image/**.h",
		"%{prj.name}/vendor/stb_image/**.cpp"
	}

	includedirs {
		"%{prj.name}/vendor/glad/include",
		"%{prj.name}/vendor/glad/src",
		"%{prj.name}/vendor/glfw/include",
		"%{prj.name}/vendor/glfw/src",
		"%{prj.name}/vendor/opengl3/include",
		"%{IncludeDir.glm}",
		"${IncludeDir.ImGui}",
		"%{prj.name}/vendor/stb_image"
	}

	links {
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "on"
