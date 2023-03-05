OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[4];
cx q[11], q[3];
cx q[3], q[7];
cx q[1], q[14];
