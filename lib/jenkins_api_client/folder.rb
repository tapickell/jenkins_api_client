require 'jenkins_api_client/urihelper'

module JenkinsApi
  class Client
    # This class communicates with the Jenkins "/folder" API to obtain details
    # about jobs, creating, deleting, building, and various other operations.
    #
    class Folder
      include JenkinsApi::UriHelper

      def initialize client
        @client = client
        @logger = @client.logger
      end

      def create_folder folder_name
        @logger.info "Creating folder '#{folder_name}'"
        @client.post_request "createItem?name=#{folder_name}&mode=com.cloudbees.hudson.plugins.folder.Folder"
      end
    end
  end
end

