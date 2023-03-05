OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[9], q[7];
cx q[13], q[11];
cx q[11], q[0];
cx q[14], q[12];
