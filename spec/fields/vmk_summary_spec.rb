require 'spec_helper'

describe Cmxl::Fields::VmkSummary do
  context 'credit' do
    subject { Cmxl::Fields::VmkSummary.parse(fixture_line(:vmk_summary_credit)) }

    it { expect(subject.amount).to eql(47.11) }
    it { expect(subject.entries).to eql(2) }
    it { expect(subject.currency).to eql('EUR') }
    it { expect(subject.credit?).to be_truthy }
    it { expect(subject.debit?).to be_falsey }
  end

  context 'debit' do
    subject { Cmxl::Fields::VmkSummary.parse(fixture_line(:vmk_summary_debit)) }

    it { expect(subject.amount).to eql(13.37) }
    it { expect(subject.entries).to eql(3) }
    it { expect(subject.currency).to eql('EUR') }
    it { expect(subject.credit?).to be_falsey }
    it { expect(subject.debit?).to be_truthy }
  end
end
