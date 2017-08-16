# coding UTF-8

class Hash
	  def shuffle
		      Hash[self.to_a.sample(self.length)]
		        end

	    def shuffle!
		        self.replace(self.shuffle)
			  end
end

class Preguntas
	attr_reader :pre_res

	def initialize
		@pre_res = Hash.new
		File.open('preguntas.txt', 'r') do |f1|
			contador = 1
			while linea = f1.gets
				if contador == 1
			    		pregunta = linea
				elsif
			    		respuesta = linea
				end
				contador += 1
				if contador == 3
					@pre_res.store(pregunta,respuesta)
					contador = 1
				end
		      	end

		end
		@pre_res.shuffle!
	end

	def print_hash
		@pre_res
	end

	def lee_pregunta(num)
		@pre_res.shift
	end
end

Banco = Preguntas.new
puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
puts
contador = 1
while contador <= 5
	preg_resp = Banco.lee_pregunta(contador)
	puts "Definición: " + preg_resp[0]
	resp_user = nil
	preg_resp[1].upcase!
	preg_resp[1].strip!
	while resp_user != preg_resp[1]
		print "Adivinar: "
		resp_user = gets.chomp.to_s
		resp_user.upcase!
		if resp_user != preg_resp[1]
			puts "Incorrecto!, Trata de nuevo"
		end
	end
	puts "Correcto!"
	puts
	contador += 1
end
puts "Fin del juego"
