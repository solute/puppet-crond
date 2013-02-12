require 'spec_helper'

describe 'crond' do
    let(:title) { 'foobar' }
    let(:params) { { :command => ['/bin/echo test'] } }

     it do
        should contain_file('/etc/cron.d/foobar').with({
            'ensure' => 'present',
            'owner'  => 'root',
            'group'  => 'root',
            'mode'   => '0644',
        })
     end

     context 'with command => /usr/sbin/runtest' do
        let (:params) { { :command => ['/usr/sbin/runtest'] } }

         it do
           should contain_file('/etc/cron.d/foobar') \
               .with_content(/\/usr\/sbin\/runtest$/)
         end
     end

    context 'with min,hour,monthday,month,weekday => 52,6,1,4,5' do
        let (:params) { { :minute => 52, :hour => 6, :month => 1, \
            :monthday => 4, :weekday => 5, :command => ['runtest'] } }

        it do
            should contain_file('/etc/cron.d/foobar') \
                .with_content(/52 6 4 1 5 root runtest/)
        end
    end
    
    context 'with minute => 33, user => someuser' do
        let (:params) { { :minute => 33, :user => 'someuser', \
            :command => ['runtest'] } }

        it do
            should contain_file('/etc/cron.d/foobar') \
                .with_content(/33 \* \* \* \* someuser runtest/)
        end
    end

    context "with command => ['firstcommand','secondcmd']" do
        let (:params) { { :minute => 33, :command => ['firstcmd', \
            'secondcmd'] } }

        it do
            should contain_file('/etc/cron.d/foobar') \
                .with_content(/33 \* \* \* \* root firstcmd && secondcmd/)
        end
    end
end
