if [ "$IS_VIDEOS" = "true" ]; then                              \
    for file_name in /NN/data/raw_data/*.${INPUT_FORMAT}; do    \
        python inference_realesrgan_video.py                    \
        -i $file_name -o data/upscaled_data                     \
        --model_name ${MODEL_NAME}                              \
        --outscale ${OUT_SCALE}                                 \
        --tile ${TILE} --tile_pad ${TILE_PAD}                   \
        --pre_pad ${PRE_PAD} ${STORE_TRUE_ARGS}                 \
        --fps ${FPS}                                            \
        --num_process_per_gpu ${NUM_PROCESS_PER_GPU}            \
        --alpha_upsampler ${ALPHA_UPSAMPLER} --suffix ${SUFFIX};\
    done;                                                       \
else                                                            \ 
    for file_name in /NN/data/raw_data/*.${INPUT_FORMAT}; do    \
        python inference_realesrgan.py                          \
        -i $file_name -o data/upscaled_data                     \
        --model_name ${MODEL_NAME}                              \
        --outscale ${OUT_SCALE}                                 \
        --tile ${TILE} --tile_pad ${TILE_PAD}                   \
        --pre_pad ${PRE_PAD} ${STORE_TRUE_ARGS}                 \
        --gpu-id ${GPU_ID}                                      \
        --alpha_upsampler ${ALPHA_UPSAMPLER} --suffix ${SUFFIX};\
    done;                                                      \
fi