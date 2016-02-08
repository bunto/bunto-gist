TEST_DIR = File.dirname(__FILE__)
TMP_DIR  = File.expand_path("../tmp", TEST_DIR)

require 'webmock/rspec'
require 'cgi'
require 'bunto'
require File.expand_path("../lib/bunto-gist.rb", TEST_DIR)

Bunto.logger.log_level = :error

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  def tmp_dir(*files)
    File.join(TMP_DIR, *files)
  end

  def source_dir(*files)
    tmp_dir('source', *files)
  end

  def dest_dir(*files)
    tmp_dir('dest', *files)
  end

  def doc_with_content(content, opts = {})
    my_site = site(opts)
    Bunto::Document.new(source_dir('_test/doc.md'), {site: my_site, collection: collection(my_site)})
  end

  def collection(site, label = 'test')
    Bunto::Collection.new(site, label)
  end

  def site(opts = {})
    conf = Bunto::Utils.deep_merge_hashes(Bunto::Configuration::DEFAULTS, opts.merge({
      "source"      => source_dir,
      "destination" => dest_dir
    }))
    Bunto::Site.new(conf)
  end

  def fixture(name)
    path = File.expand_path "./fixtures/#{name}.json", File.dirname(__FILE__)
    File.open(path).read
  end
end
