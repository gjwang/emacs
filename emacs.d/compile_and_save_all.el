(setq split-height-threshold 0)

(setq split-width-threshold nil)

;; F9 compile 

;; C-F9 save and compile

(defun defineCompileCmd()

  (interactive)

  (setq boost_path 

	"E:/workspace/C++/lib/boost/boost1.46")

  (setq ace_src_path 

	"E:/workspace/C++/lib/ace/ace6.0.4/ACE_wrappers")

  (setq ace_include_path 

	"E:/workspace/C++/lib/ace/ace6.0.4/ace/include")

  (setq ace_mingw_lib_d 

	"E:/workspace/C++/lib/ace/ace6.0.4/ace/lib_gcc/lib_d")

  (setq ace_mingw_lib 

	"E:/workspace/C++/lib/ace/ace6.0.4/ace/lib_gcc/lib")

  (setq compile_file_name (substring (buffer-name (current-buffer)) 0 (string-match "[.]"  (buffer-name (current-buffer)))))

  (setq compile_file_name (concat compile_file_name ".exe"))

  (setq compile-command 

	(concat  "g++ -g -I"

		boost_path

		" -I"

		ace_src_path

		" -I"

		ace_include_path

		" -L"

		ace_mingw_lib

		" -lACE " 

		(buffer-name (current-buffer))

		" -o "

		compile_file_name

		" && "

		compile_file_name

		))

  )

 

(defun shrink-compile-window()

  "shrink compile window, avoid compile window occupy 1/2 hight of whole window"

  (interactive)

  ;;(select-window (get-buffer-window "*compilation*"))

  (setq compiled_buffer_name (buffer-name (current-buffer)))

  (switch-to-buffer-other-window "*compilation*")

  (if (< (/ (frame-height) 3) (window-height))

      (shrink-window (/ (window-height) 2)))

  (switch-to-buffer-other-window compiled_buffer_name)

  )

 

;;C-F9 save all buffers and compile

(global-set-key [C-f9] '(lambda()

			 "Save buffers and start compile"

			 (interactive)

			 (save-some-buffers t)

			 (defineCompileCmd)

			 (compile compile-command)

			 (shrink-compile-window)

			 )

		) 

;;F9 compile current buffer

(global-set-key [f9] '(lambda ()

			(interactive)

			(defineCompileCmd)	

			(compile compile-command)

			(shrink-compile-window)

			)

)

