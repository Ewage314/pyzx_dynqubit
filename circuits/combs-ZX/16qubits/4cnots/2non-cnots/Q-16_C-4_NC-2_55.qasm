OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[7];
z q[3];
cx q[9], q[0];
z q[12];
cx q[14], q[1];
cx q[4], q[13];
