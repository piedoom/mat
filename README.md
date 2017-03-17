# mat

What is this?
=============

There is a lack of good, free-to-use textures on the internet for use in CG projects.  This repository holds free textures licensed under CC0.

What's the problem with textures on the web today?
==================================================

Way back, before `cgtextures` became `textures.com`, there was a decent amount of free, high-resolution textures for use in CG.  However, it seems that nowadays high-quality, free textures are difficult to come by.  There certainly are websites with free textures, but these sites have multiple problems:

- Horrible organization
- Dubious legality
- Hit-and-miss quality

We're gonna fix that!

Who can use this?
=================

Anyone.  All textures are free to use and distribute.  Please keep this in mind when submitting textures.  They will be licensed under CC0.  If you don't want that, this may not be the best route for you.

Basically, you can do whatever you want with these textures except bundle them up as is, and sell them as a texture pack.  That'd be pretty slimy of you.

Can I only use these textures with Blender?
===========================================

No, but example materials are provided which make using Blender fast and easy.  You can use whatever 3D suite you prefer.  

**However**, if you submit a material, the thumbnail must be rendered with Blender.

Roadmap
=======

There's some features I want to work out here

- [ ] Build software to utilize `.yml` files and act as a material browser
- [ ] Build Blender addon
- [ ] Build web API to avoid needing to clone repository for just one texture
- [ ] Finalize manifest file standards


Why are there so many files?
============================

Most textures will have multiple maps - 

- diffuse
- height
- roughness
- reflection
- normal

Additionally, every texture will be assembled into a Cycles material and have a rendered thumbnail, along with an example material file bundled.

Every material also has a manifest `.yml` file that describes the location of the different maps, keeps track of the characteristics of the material, and contains metadata like authors.  This can be later utilized in software material browsers.

How can I contribute?
=====================

To contribute, go out and take some pictures!  To avoid problems with legality, please only submit PRs for images of which you hold the rights.

There are multiple steps in submitting a material.  This might look complicated, but don't fret.  If you forget or misunderstand anything, it's just a simple fix!  This is to make sure things are consistent, but don't be deterred.  I'm very new to this myself.

1. Take high quality photos of the material.
2. Use a program like Gimp, Photoshop, or AwesomeBump to create different maps.  You don't have to include every map for every texture, but the more, the better.
    - Keep textures square, with a size either a power of two, or a power of ten.  (e.g., 512x512 or 1000x1000 are acceptable.  Sizes like 900x900 or 912x512 are not acceptable.)
3. Create a new subfolder in one of the root `textures` folders corresponding to the name of your texture.  
    - Use snake casing for folders and filenames.  Avoid capital letters, and use underscores instead of spaces.  Please keep filenames in English.
    - These don't have to be super descriptive.  For instance, if you took a picture of a piece of sheet metal, a folder named `sheet_metal` fits perfectly.
    - You may notice there are several subfolders already, like "rock" and "wood".  If your texture fits one of these descriptors, put your new subfolder inside of it.  If not, create a new one.  These folders are for human readability.  Keep it general like "plastic", etc.
    - Name your texture files appropriately.  They should have the same base name as your folder, with another word appended describing the map. 
    - For instance, if you were creating a texture called "sheet_metal", the folder might look like this:
        - `sheet_metal_diffuse`
        - `sheet_metal_height`
        - `sheet_metal_normal`
        - `sheet_metal_reflection`
        - `sheet_metal_roughness`
    - When you create the `.blend`, thumbnail, and `.yml` files (described later in this list), they will follow the same nomenclature.  For example:
        - `sheet_metal.blend`
        - `sheet_metal_thumb`
4. Use the starter Blender file in the `/resources/blender/[version_number]/` folder, and create a material in Blender using created textures.  If you need help setting up, check example Blender material files in already-existing textures in the repo.
5. Save the Blender file in the location as mentioned above.
6. Render out the image with it's default settings, and save that image in the location as mentioned above.
7. YAML file creation - I'm still working on this bit, so ignore this for now!
8. Keep in mind, this is all you need.  Please don't include GIMP or PSD files.

Things to keep in mind while rendering:
=======================

- Blender is using HDR.  You shouldn't be using any extra lighting unless it is absolutely necessary for conveying the intended look of your material
- Blender is using a Physically-Based node setup as documented [here](https://www.youtube.com/watch?v=V3wghbZ-Vh4).  Avoid using multiple shaders, and stick to either the Dialectric or Metallic shader provided.  If you need help, check out the aforementioned link, or look at some already-created materials as an example.
- Resolution, target object, and camera settings must stay the same for consistency.  You can increase the amount of samples, but please do not decrease any more than the default amount.
- Export as a PNG.  The background is transparent!
- As of writing, Blender is using experimental features like microdisplacements.  Please upgrade to at least version 2.78 before rendering.  Use this to your advantage - use heightmaps instead of normalmaps with true displacement when doing thumbnail renders.
- Blender is also using a custom colorspace called Filmic Blender.  Please, do not render in sRGB.

Things to keep in mind while creating textures:
===============================================

- No DSLR required!  If you can shoot a good picture with your phone, do it.  Always ask yourself, "Is this something I would use in my own renders?" If the answer is yes, go for it!
- Use the correct file formats.  Usually for photos, a high-quality `.jpg` image will be well suited.  For height maps, you may want to use a 16-bit `.tiff`, but that isn't required.

