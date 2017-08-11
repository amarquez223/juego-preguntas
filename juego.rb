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
contador = 1
while contador <= 5
	preg_resp = Banco.lee_pregunta(contador)
	puts "Pregunta: " + preg_resp[0]
	resp_user = nil
	while resp_user != preg_resp[1].strip
		puts "Respuesta: "
		resp_user = gets.chomp.to_s
		if resp_user != preg_resp[1].strip
			puts "Intenta de nuevo"
		end
	end
	puts "MUY BIEN!!!"
	contador += 1
end