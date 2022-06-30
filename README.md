![Build](https://github.com/gdagil/Real-ESRGAN-docker/actions/workflows/docker-publish.yaml/badge.svg)
# Real-ESRGAN-docker

Simple image to upscaling images and videos in  by [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

## Fast way to use it with default settings
1. Place the files to be processed in `data/raw_data` directory
2. Say, what you want to processed in `docker-compose.yaml` - `IS_VIDEOS`  and `INPUT_FORMAT` environment variables
3. run it with the following command
```bash
sudo docker-compose up
```

## Usung the image (environment variables)
* `IS_VIDEOS` - true / false parameter
* `INPUT_FORMAT` - file_extension
* `MODEL_NAME` - parameter of real-ESRGAN of the weiths, what you want to use
    * RealESRGAN_x4plus
    * RealESRNet_x4plus
    * RealESRGAN_x4plus_anime_6B
    * RealESRGAN_x2plus
    * realesr-animevideov3
* `TILE`
* `TILE_PAD`
* `PRE_PAD` 
* `STORE_TRUE_ARGS`
    * For video: `--face_enhance --fp32 --extract_frame_first`
    * For images: `--face_enhance --fp32 `
* `ALPHA_UPSAMPLER` - pattern of upsampling alpha channel 
    * `realesrgan`
    * `bicubic`
* `FPS` - fps of output video
* ` NUM_PROCESS_PER_GPU`: 2
* `GPU_ID` 

### For eample (images)
```bash
docker run --rm --gpus all \
  -e IS_VIDEOS=false \
  -e INPUT_FORMAT=jpg -e MODEL_NAME=RealESRGAN_x4plus \
  -e OUT_SCALE=2 -e TILE=0 -e TILE_PAD=10 -e PRE_PAD=0 -e SUFFIX=upped \
  -e ALPHA_UPSAMPLER=realesrgan -e GPU_ID=0 \
  danil2286/real-esrgan:latest
```


## BibTeX
    @InProceedings{wang2021realesrgan,
        author    = {Xintao Wang and Liangbin Xie and Chao Dong and Ying Shan},
        title     = {Real-ESRGAN: Training Real-World Blind Super-Resolution with Pure Synthetic Data},
        booktitle = {International Conference on Computer Vision Workshops (ICCVW)},
        date      = {2021}
    }
