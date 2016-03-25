module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		sass:
			dist:
				files:
					'styles/main.css' : 'styles/main.sass'
					'components/projectBadge.css' : 'components/projectBadge.scss'

		connect:
			server:
				options:
					port: 8000
					base: '.'

		jade:
			compile:
				options:
					pretty: true
				files:
					'index.html' : 'index.jade'

		watch:
			sass:
				files: ['styles/*.sass', 'components/*.scss']
				tasks: ['sass']
			jade:
				files: ['./*.jade']
				tasks: ['jade']

		copy:
			main:
				files: [
					{ expand: true, src: ['fonts/**'], dest: 'dist/'},
					{ expand: true, src: ['images/**'], dest: 'dist/'},
					{ expand: true, src: ['bower_components/**'], dest: 'dist/'},
					{ expand: true, src: ['styles/*.css'], dest: 'dist/'},
					{ expand: true, src: ['*.html'], dest: 'dist/'},
					{ expand: true, src: ['components/*.html'], dest: 'dist/'},
					{ expand: true, src: ['components/*.css'], dest: 'dist/'}
				]

		clean:
			src: ['styles/*.css', 'styles/*.css.map', 'components/*.css', 'components/*.css.map', 'index.html']



	grunt.loadNpmTasks('grunt-contrib-clean')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-contrib-sass')
	grunt.loadNpmTasks('grunt-contrib-jade')
	grunt.loadNpmTasks('grunt-contrib-connect')
	grunt.loadNpmTasks('grunt-contrib-copy')
	grunt.loadNpmTasks('grunt-shell')

	grunt.registerTask('default', ['clean', 'build', 'connect:server', 'watch'])
	grunt.registerTask('build', ['sass', 'jade'])
	grunt.registerTask('pack', ['clean', 'build', 'copy'])
	grunt.registerTask('publish', ['pack'])
