# ComfyUI Docker

An easy way to get started with ComfyUI.

I have mostly experimented with image generation, but audio and video capabilities should also work.

## Download weights

Putting instructions down for Qwen-Image. Instructions for other models can be found in
[ComfyUI's documentation](https://comfyanonymous.github.io/ComfyUI_examples/).

### [Qwen-Image](https://github.com/QwenLM/Qwen-Image)

```bash
mkdir models
mkdir models/diffusion_models
mkdir models/text_encoders
mkdir models/vae

wget -P models/diffusion_models https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_fp8_e4m3fn.safetensors
wget -P models/text_encoders https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
wget -P models/vae https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
wget -P models/diffusion_models https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2509_fp8_e4m3fn.safetensors
```

## Running

```bash
docker run -it --rm --gpus=all -p 8188:8188 \
    -v $(pwd)/models:/root/ComfyUI/models \
    -v $(pwd)/user:/root/ComfyUI/user \
    -v $(pwd)/output:/root/ComfyUI/output \
    $(docker build -q .)
```
