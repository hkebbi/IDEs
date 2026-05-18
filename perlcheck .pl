use Net::GitHub;

my $github = Net::GitHub->new(  # Net::GitHub::V3
    login => 'lalaand', pass => 'secret'
);

# If you use two factor authentication you can pass in the OTP. Do
# note that OTPs expire quickly and you will need to generate an oauth
# token to do anything non-trivial.
my $github = Net::GitHub->new(
    login =>   'lalaand',
    pass =>    'secret',
    otp =>     '123456789',
);

# Pass api_url for GitHub Enterprise installations. Do not include a
# trailing slash
my $github = Net::GitHub->new(  # Net::GitHub::V3
    login =>   'fayland',
    pass =>    'secret',
    api_url => 'https://gits.aresweet.com/api/v3'
);

# suggested
# use OAuth to create token with user/pass
my $github = Net::GitHub->new(  # Net::GitHub::V3
    access_token => $token
);

# L<Net::GitHub::V3::Users>
my $user = $github->user->show('nothingmuch');
$github->user->update( bio => 'Just Another Perl Programmer' );

# L<Net::GitHub::V3::Repos>
my @repos = $github->repos->list;
my $rp = $github->repos->create( {
    "name" => "Hello-World",
    "description" => "This is your first repo",
    "homepage" => "https://github.com"
} );
