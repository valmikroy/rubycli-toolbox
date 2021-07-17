require 'toolbox'


module Toolbox

      module Helper
        
        def log_info(msg)
          Toolbox.logger.info(msg)
        end  

        def log_debug
          Toolbox.logger.debug(msg)
        end  

        def log_error
          Toolbox.logger.error(msg)
        end  
      end

end

