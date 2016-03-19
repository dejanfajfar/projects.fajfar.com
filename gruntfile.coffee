module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		sass:
			dist:
				files:
					'styles/main.css' : 'styles/main.sass'

		shell:
			start_srv:
				command: 'ws'

		clean:
			css: ['styles/*.css', 'styles/*.css.map']



	grunt.loadNpmTasks('grunt-contrib-clean')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-contrib-sass')
	grunt.loadNpmTasks('grunt-shell')

	grunt.registerTask('default', ['clean:css', 'sass', 'shell:start_srv'])
	grunt.registerTask('serve', ['shell:start_srv'])
