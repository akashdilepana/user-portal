/*! Image Uploader - v1.0.0 - 15/07/2019
 * Copyright (c) 2019 Christian Bayer; Licensed MIT */
(function ($) {
    $.fn.imageUploader_2 = function (options) {
        let defaults = {
            preloaded: [],
            imagesInputName: 'images',
            preloadedInputName: 'preloaded',
            label: '(6 Files only)'
        };
        let plugin = this;
        plugin.settings = {};
        plugin.init = function () {
            plugin.settings = $.extend(plugin.settings, defaults, options);
            plugin.each(function (i, wrapper) {
                let $container = createContainer();
                $(wrapper).append($container);
                $container.on("dragover", fileDragHover.bind($container));
                $container.on("dragleave", fileDragHover.bind($container));
                $container.on("drop", fileSelectHandler.bind($container));
                if (plugin.settings.preloaded.length) {
                    $container.addClass('has-files');
                    let $uploadedContainer = $container.find('.uploaded');
                    for (let i = 0; i < plugin.settings.preloaded.length; i++) {
                        $uploadedContainer.append(createImg(plugin.settings.preloaded[i].src, plugin.settings.preloaded[i].id, !0))
                    }
                }
            })
        };
        let dataTransfer = new DataTransfer();
        let createContainer = function () {
            let $container = $('<div>', {class: 'jquery-image-uploader'}), $input = $('<input>', {
                type: 'file',
                id: 'image_upload_2',
                name: plugin.settings.imagesInputName,
                multiple: ''
            }).appendTo($container), $uploadedContainer = $('<div>', {class: 'uploaded'}).appendTo($container),
                    $textContainer = $('<div>', {class: 'upload-text'}).appendTo($container),
                    $i = $('<i>', {class: 'material-icons'}).appendTo($textContainer),
                    $span = $('<span>', {text: plugin.settings.label}).appendTo($textContainer);
            $container.on('click', function (e) {
                prevent(e);
                $input.trigger('click')
            });
            $input.on("click", function (e) {
                e.stopPropagation()
            });
            $input.on('change', fileSelectHandler.bind($container));
            return $container
        };
        let prevent = function (e) {
            e.preventDefault();
            e.stopPropagation()
        };
        let createImg = function (src, id) {
            let $container = $('<div>', {id: 'image_view_div_2'}), $img = $('<img>', {src: src}).appendTo($container),
                    $button = $('<button>', {class: 'delete-image btn btn-xs btn-danger', style: 'align-items: center'}).appendTo($container),
                    $i = $('<i>', {class: 'fa fa-close', text: ''}).appendTo($button);
            if (plugin.settings.preloaded.length) {
                $container.attr('data-preloaded', !0);
                let $preloaded = $('<input>', {
                    type: 'hidden',
                    name: plugin.settings.preloadedInputName + '[]',
                    value: id
                }).appendTo($container)
            } else {
                $container.attr('data-index', id)
            }
            $container.on("click", function (e) {
                prevent(e)
            });
            $button.on("click", function (e) {
                prevent(e);
                console.log(dataTransfer);
                if ($container.data('index')) {
                    let index = parseInt($container.data('index'));
                    $container.find('.uploaded-image[data-index]').each(function (i, cont) {
                        if (i > index) {
                            $(cont).attr('data-index', i - 1)
                        }
                    });
                    dataTransfer.items.remove(index)
                }
                $container.remove();
                if (!$container.find('.uploaded-image').length) {
                    $container.removeClass('has-files')
                }
            });
            return $container
        };
        let fileDragHover = function (e) {
            prevent(e);
            if (e.type === "dragover") {
                $(this).addClass('drag-over')
            } else {
                $(this).removeClass('drag-over')
            }
        };
        let fileSelectHandler = function (e) {
            prevent(e);
            let $container = $(this);
            $container.removeClass('drag-over');
            let files = e.target.files || e.originalEvent.dataTransfer.files;
            setPreview($container, files)
        };
        let setPreview = function ($container, files) {
            $container.addClass('has-files');
            let $uploadedContainer = $container.find('.uploaded'), $input = $container.find('input[type="file"]');
            $(files).each(function (i, file) {
                dataTransfer.items.add(file);
                $uploadedContainer.append(createImg(URL.createObjectURL(file), dataTransfer.items.length - 1))
            });
            $input.prop('files', dataTransfer.files)
        };
        let random = function () {
            return Date.now() + Math.floor((Math.random() * 100) + 1)
        };

        plugin.getImages_2 = function () {
            return dataTransfer.files;
        }
        this.init();
        return this
    }
}(jQuery))
