---
title: 'Steam on OSX High Sierra'
date: '2018-12-23 13:33:34'
tags: steam osx
---

# Deja vu
[One of my earlier posts](https://vext.info/2017/10/08/how-to-use-steam-on-mac-osx.html) described how to make the Steam client work on Mac OSX. That was pre-High Sierra, and all that was needed back then was renaming some files from uppercase to lowercase due to an error message. Fastfoward a year or so and between new security features of High Sierra and lack of developer support from Valve, the Steam client is broken again, at least for me.

There are [multiple](https://steamcommunity.com/discussions/forum/2/1520386297680789617/) [community threads](https://steamcommunity.com/discussions/forum/2/1473095331487678739/) on the Steam forums complaining of these issues, as well, with varying reports of success.

After trying numerous failed suggestions, the following process worked for me. If you know how to perform each of these steps, the summary should suffice. If not, keep reading below for more details.

# Summary steps
Note: Steps 1 and 2 might be optional, but I started "clean" to make sure that everything would work.
1. Remove the Steam application package from `/Applications`.
2. Remove the Steam folder from `~/Library/Application Support/`.
3. Create a new APFS volume that is **not** case-sensitive.
4. Install the Steam application and run it (it will update once, then fail to run anymore).
5. Move the newly-created folder `~/Library/Application Support/Steam` to the new APFS volume from step 3.
6. Create a symbolic link in `~/Library/Application Support/` called `Steam` that points to the folder from step 5.

At this point the Steam client should load successfully, allowing login and installation of games.

# More details and options
Unfortunately, this process doesn't really lend itself to a cheat sheet. While there are command line options for creating the new APFS volume, there is some risk with trying to create a copy/paste version of those commands: the setup depends on the original configuration of disk(s) present on the machine, and existing APFS volume(s) present. If you enter the wrong values, you could mess up your system. As such, I am only providing the step-by-step instructions through the GUI, which should be safer.

1. Remove the Steam application package from `/Applications` via terminal: `rm -r /Applications/Steam.app`
2. Remove the Steam folder from `~/Library/Application Support/` via terminal: `rm -r ~/Library/Application\ Support/Steam`
3. Create a new APFS volume that is **not** case-sensitive:
    1. Open Disk Utility, right-click the internal disk, and select "Add APFS Volume..."
    ![Add APFS Volume...](../../../assets/images/addApfs.png)
    2. On the following dialog, name the volume (I named mine steamPath) and select "APFS" as the format (do NOT use the case-sensitive versions).
    ![Format and name](../../../assets/images/steamPath.png)
4. Install the Steam application and run it (it will update once, then fail to run anymore).
5. Move the newly-created folder `~/Library/Application Support/Steam` to the new APFS volume via terminal: `mv ~/Library/Application\ Support/Steam /Volumes/steamPath/.` <-- Make sure you enter the name you gave the new volume if it's different than "steamPath."
6. Create a symbolic link in `~/Library/Application Support/` called `Steam` that points to the folder from step 5 via terminal: `ln -s /Volumes/steamPath/Steam ~/Library/Application\ Support/Steam` <-- Same here.

Now you should be able to launch the Steam client successfully. Note that you will have to download your games again.

If you already have a lot of games downloaded, in step #2 you might be able to temporarily move the Steam folder from `~/Library/Application Support/` to another location, then overwrite the new folder in step 5 with it. I did not test this myself, so I don't know if there are any conflicts that might arise as a result.

# Error messages
I'm including the error messages I encountered here, in the hopes that users googling these errors might find this post.

```
[2018-12-23 00:03:37] Startup - updater built Aug 22 2016 17:36:46
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.60.1/Common/ChunkCompression.cpp:49: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.60.1/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Exceptions.plist'
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.60.1/Common/ChunkCompression.cpp:49: Error: unsupported compressor 8
/BuildRoot/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/AppleFSCompression-96.60.1/Libraries/CompressData/CompressData.c:353: Error: Unknown compression scheme encountered for file '/System/Library/CoreServices/CoreTypes.bundle/Contents/Library/AppExceptions.bundle/Exceptions.plist'
[2018-12-23 00:03:37] Startup - updater built Nov 26 2018 12:20:59
found breakpad via in process memory: '/Users/<REDACTED>/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/Frameworks/Breakpad.framework/Versions/A/Resources'
Installing breakpad crash handler
[2018-12-23 00:03:37] Steam requires that '/Users/<REDACTED>/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS' be on a case-insensitive filesystem.
SteamID:  0, universe Public
[2018-12-23 00:03:37] Shutdown
[2018-12-23 00:03:37] Steam requires that '/Users/<REDACTED>/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS' be on a case-insensitive filesystem.
[2018-12-23 00:03:37] Verifying installation...
[2018-12-23 00:03:37] Unable to read and verify install manifest /Users/<REDACTED>/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/package/steam_client_osx.installed
[2018-12-23 00:03:37] Verification complete
[2018-12-23 00:03:37] Downloading update...
[2018-12-23 00:03:37] Checking for available updates...
[2018-12-23 00:03:37] Downloading manifest: client-download.steampowered.com/client/steam_client_osx
[2018-12-23 00:03:37] Error: Download failed: http error 0
```
